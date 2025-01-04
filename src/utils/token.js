import jwt from 'jsonwebtoken';

const generateToken = (user) => {
  const payload = {
    userId: user.userId,
    email: user.email,
  };

  const accessToken = jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
    expiresIn: '15m',
  });

  const refreshToken = jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, {
    expiresIn: '7d',
  });

  return { accessToken, refreshToken };
};

const decodedRefreshToken = (refreshToken) => {
  const secret = process.env.REFRESH_TOKEN_SECRET;

  try {
    const decoded = jwt.verify(refreshToken, secret);
    return decoded.userId;
  } catch (verificationError) {
    if (verificationError.name === 'TokenExpiredError') {
      return res.status(403).json({ message: 'Token has expired' });
    }
    if (verificationError.name === 'JsonWebTokenError') {
      return res.status(403).json({ message: 'Invalid token' });
    }
    return res.status(403).json({ message: 'Failed to verify token' });
  }

}

export { generateToken, decodedRefreshToken };