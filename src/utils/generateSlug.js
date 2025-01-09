import slugify from 'slugify';

export const generateSlug = (text) => slugify(text, {
    lower: true, 
    locale: "vi", 
    remove: /[*+~.()'"!:@]/g, // Loại bỏ các ký tự không hợp lệ
  });