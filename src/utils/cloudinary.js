import { v2 as cloudinary } from "cloudinary";

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
});

const uploadFile = async (filePath) => {
    try {
        const result = await cloudinary.uploader.upload(filePath, {
            folder: "ToyStore",
        });
        const optimizeUrl = cloudinary.url(result.public_id, {
            fetch_format: 'auto',
            quality: 'auto'
        });
        console.log("Upload successful:", optimizeUrl);
        return { url: optimizeUrl, publicId: result.public_id };
    } catch (error) {
        console.error("Upload failed:", error);
        throw error;
    }
};

export default uploadFile;