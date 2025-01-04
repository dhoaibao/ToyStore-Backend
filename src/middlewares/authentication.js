import jwt from 'jsonwebtoken';

export const auth = async (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;

        if (!authHeader) {
            return res.status(401).json({ message: 'Authorization header is missing' });
        }

        const token = authHeader.split(' ')[1];
        if (!token) {
            return res.status(401).json({ message: 'Token is missing from the authorization header' });
        }

        const secret = process.env.ACCESS_TOKEN_SECRET;

        try {
            const decoded = jwt.verify(token, secret);
            req.userId = decoded.userId;
            next();
        } catch (verificationError) {
            if (verificationError.name === 'TokenExpiredError') {
                return res.status(403).json({ message: 'Token has expired' });
            }
            if (verificationError.name === 'JsonWebTokenError') {
                return res.status(403).json({ message: 'Invalid token' });
            }
            return res.status(403).json({ message: 'Failed to verify token' });
        }
    } catch (err) {
        console.error('Authorization error:', err); // Ghi nhật ký lỗi
        res.status(500).json({ message: 'Internal server error' });
    }
};