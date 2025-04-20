import prisma from "../config/prismaClient.js";
import { generateSlug } from "../utils/generateSlug.js";
import { uploadFile, deleteFile } from "../utils/supabaseStorage.js";

const include = {
  thumbnail: {
    select: {
      url: true,
    }
  }
}

export const getAllNews = async (req, res) => {
  try {
    const {
      page = 1,
      limit = 10,
      keyword = "",
      sort = "",
      order = "",
      isActive,
    } = req.query;
    const skip = (page - 1) * limit;
    const take = parseInt(limit);

    const filters = {};

    if (keyword) {
      filters.title = {
        contains: keyword,
        mode: "insensitive",
      };
    }

    if (isActive) {
      filters.isActive = isActive === "true";
    }

    const sortOrder = {};

    if (sort && order) {
      sortOrder[sort] = order;
    } else {
      sortOrder.updatedAt = "desc";
    }

    let news = [];
    if (take === -1) {
      news = await prisma.news.findMany({
        where: filters,
        orderBy: sortOrder,
      });
    } else {
      news = await prisma.news.findMany({
        where: filters,
        skip,
        take,
        orderBy: sortOrder,
        include
      });
    }

    const totalNews = await prisma.news.count({ where: filters });

    return res.status(200).json({
      message: "All news fetched!",
      data: news,
      pagination: {
        total: totalNews,
        page: parseInt(page),
        limit: take,
        totalPages: Math.ceil(totalNews / take),
      },
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const getNewsBySlug = async (req, res) => {
  try {
    const { slug } = req.params;

    const news = await prisma.news.findUnique({
      where: { slug },
      include
    });

    if (!news) {
      return res.status(404).json({ message: "News not found!" });
    }

    return res.status(200).json({
      message: "News fetched!",
      data: news,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const createNews = async (req, res) => {
  try {
    const { title, content } = req.body;
    const file = req.file;

    if (!title || !content) {
      return res.status(400).json({ message: "Missing required fields!" });
    }

    const slug = generateSlug(title);
    const { url, filePath } = await uploadFile(file);

    const news = await prisma.news.create({
      data: {
        title,
        slug,
        content,
        thumbnail: {
          create: {
            url,
            filePath,
          },
        },
      },
      include
    });

    return res.status(201).json({
      message: "News created!",
      data: news,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const updateNews = async (req, res) => {
  try {
    const { id } = req.params;

    const { title, content } = req.body;  

    const existingNews = await prisma.news.findUnique({
      where: { newsId: parseInt(id) },
      include: {
        thumbnail: true,
      },
    });

    if (!existingNews) {
      return res.status(404).json({ message: "News not found!" });
    }

    const fields = {
      title,
      slug: title ? generateSlug(title) : null,
      content,
    };

    const data = Object.entries(fields).reduce((acc, [key, value]) => {
      if (value != null && value !== existingNews[key]) {
        acc[key] = value;
      }
      return acc;
    }, {});
    
    if (req.file) {
        const file = req.file;
        const { url, filePath } = await uploadFile(file);
        await deleteFile(existingNews.thumbnail.filePath);
        data.thumbnail = {
            update: {
                url,
                filePath
            }
        }
    }

    console.log(data);

    const updatedNews = await prisma.news.update({
      where: { newsId: parseInt(id) },
      data,
      include
    });

    return res.status(200).json({
      message: "News updated!",
      data: updatedNews,
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};

export const deleteNews = async (req, res) => {
  try {
    const { id } = req.params;

    const newsExists = await prisma.news.findUnique({
      where: { newsId: parseInt(id) },
    });

    if (!newsExists) {
      return res.status(404).json({ message: "News not found!" });
    }

    await prisma.news.delete({ where: { newsId: parseInt(id) } });

    return res.status(200).json({ message: "News deleted!" });
  } catch (error) {
    console.error(error);
    return res.status(500).json({
      message: "Internal Server Error",
      error: error.message,
    });
  }
};
