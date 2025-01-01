import jwt from 'jsonwebtoken';

const generateToken = (user) => {
    const payload = {
      userId: user.userId, 
      email: user.email,
    };
    
    const accessToken = jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
      expiresIn: '7d',
    });
  
    const refreshToken = jwt.sign(payload, process.env.REFRESH_TOKEN_SECRET, {
      expiresIn: '7d',
    });
  
    return { accessToken, refreshToken };
  };
  

export default generateToken;