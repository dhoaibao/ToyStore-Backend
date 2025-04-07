import jwt from "jsonwebtoken";
import prisma from "../config/prismaClient.js";

export const authentication = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;

    if (!authHeader) {
      return res
        .status(401)
        .json({ message: "Authorization header is missing" });
    }

    const token = authHeader.split(" ")[1];
    if (!token) {
      return res
        .status(401)
        .json({ message: "Token is missing from the authorization header" });
    }

    const secret = process.env.ACCESS_TOKEN_SECRET;

    try {
      const decoded = jwt.verify(token, secret);
      req.userId = decoded.userId;

      const existingUser = await prisma.user.findUnique({
        where: {
          userId: req.userId,
        },
      });

      if (!existingUser.isActive) {
        return res.status(403).json({ message: "User is inactive" });
      }

      next();
    } catch (verificationError) {
      if (verificationError.name === "TokenExpiredError") {
        return res.status(403).json({ message: "Token has expired" });
      }
      if (verificationError.name === "JsonWebTokenError") {
        return res.status(403).json({ message: "Invalid token" });
      }
      return res.status(403).json({ message: "Failed to verify token" });
    }
  } catch (err) {
    console.error("Authentication error:", err);
    res.status(500).json({ message: "Internal server error" });
  }
};

export const authorization = async (req, res, next) => {
  try {
    const existingUser = await prisma.user.findUnique({
      where: {
        userId: req.userId,
      },
      select: {
        roleId: true,
      },
    });

    const existingRole = await prisma.role.findUnique({
      where: {
        roleId: existingUser.roleId,
      },
      include: {
        permissions: true,
      },
    });

    if (!existingRole) {
      return res
        .status(404)
        .json({ message: "Authorization: Role not found!" });
    }

    const permissions = existingRole.permissions;

    const method = req.method;
    const originalUrl = req.originalUrl;
    const routePath = req.route.path;

    const pathWithoutQuery = originalUrl.split("?")[0];

    const originalParts = pathWithoutQuery.split("/").filter(Boolean);
    const routeParts = routePath.split("/").filter(Boolean);

    let combinePath = pathWithoutQuery.endsWith('/') ? pathWithoutQuery.slice(0, -1) : pathWithoutQuery;

    if (routeParts.length > 0) {
      const overlapIndex = originalParts.findIndex(
        (part) => part === routeParts[0],
      );

      originalParts.splice(overlapIndex, originalParts.length);

      combinePath = "/" + originalParts.join("/") + "/" + routeParts.join("/");
    }

    const checkPermission = permissions.some((permission) => {
      return permission.apiPath === combinePath && permission.method === method;
    });

    // console.log({ combinePath, checkPermission });

    if (!checkPermission) {
      return res
        .status(403)
        .json({ message: "Authorization: Permission denied!" });
    }

    next();
  } catch (err) {
    console.error("Authorization error:", err);
    res.status(500).json({ message: "Internal server error" });
  }
};
