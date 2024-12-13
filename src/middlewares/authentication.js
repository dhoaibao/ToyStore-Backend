export const auth = async (req, res, next) => {
    try {
        const token = req.headers.authorization?.split(' ')[1];

        if (!token) {
            return res.status(401).json({ message: 'No token provided' });
        }

        const secret = process.env.JWT_SECRET;
        const decoded = jwt.verify(token, secret);

        req.user = { id: decoded.id, email: decoded.email };
        next();
    } catch (err) {
        return res.status(403).json({ message: 'Invalid or expired token' });
    }
};