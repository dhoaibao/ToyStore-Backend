import { v2 as cloudinary } from "cloudinary";

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
});

const uploadFile = async (filePath) => {
    try {
        const result = await cloudinary.uploader.upload(filePath, {
            folder: "ToyStore", // Thay bằng tên thư mục bạn muốn
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

const uploadFromUrl = async (fileUrl) => {
    try {
        const result = await cloudinary.uploader.upload(fileUrl, {
            folder: "ToyStore",
        });
        console.log("Upload from URL successful:", result);
        return result.secure_url;
    } catch (error) {
        console.error("Upload from URL failed:", error);
        throw error;
    }
};

const listFiles = async () => {
    try {
        const resources = await cloudinary.api.resources({
            type: "upload",
            prefix: "ToyStore", // Lọc theo thư mục
        });
        console.log("Files:", resources.resources);
    } catch (error) {
        console.error("Error listing files:", error);
    }
};

const deleteFile = async (publicId) => {
    try {
        const result = await cloudinary.uploader.destroy(publicId);
        console.log("Delete successful:", result);
    } catch (error) {
        console.error("Error deleting file:", error);
    }
};

export { uploadFile, uploadFromUrl, listFiles, deleteFile };