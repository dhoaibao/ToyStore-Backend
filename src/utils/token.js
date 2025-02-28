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
    return decoded;
  } catch (verificationError) {
    console.error('Error verifying refresh token:', verificationError.name);
    return null;
  }

}

export { generateToken, decodedRefreshToken };