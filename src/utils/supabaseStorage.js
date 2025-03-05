import supabase from "../config/supabaseConfig.js";
import { decode } from "base64-arraybuffer";
import path from "path";

export const uploadFile = async (file) => {
    try {
        const filePath = 'images/' + file.originalname + '-' + Date.now();

        const fileBase64 = decode(file.buffer.toString("base64"));

        const { data, error } = await supabase.storage
            .from('ToyStore')
            .upload(filePath, fileBase64, {
                contentType: file.mimetype,
            });

        if (error) {
            throw error;
        }

        const { data: image } = supabase.storage.from('ToyStore').getPublicUrl(data.path);

        return { url: image.publicUrl, filePath: data.path };
    } catch (error) {
        throw error;
    }
}

export const uploadMultipleFiles = async (files) => {
    try {
        const uploadResults = await Promise.all(
            files.map(async (file) => {
                const { url, filePath } = await uploadFile(file);
                return { url, filePath };
            })
        );

        return uploadResults;
    } catch (error) {
        throw error;
    }
}

export const uploadFileFromUrl = async (url) => {
    try {
        const fileName = path.basename(url);

        const response = await fetch(url, {
            method: 'GET',
        });
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const arrayBuffer = await response.arrayBuffer();
        const buffer = Buffer.from(arrayBuffer);

        const { url: uploadedUrl, filePath } = await uploadFile({
            buffer,
            originalname: fileName,
            mimetype: response.headers.get('content-type'),
        });


        return { url: uploadedUrl, filePath };
    } catch (error) {
        throw error;
    }
};

export const deleteFile = async (filePath) => {
    try {
        const { error } = await supabase.storage
            .from('ToyStore')
            .remove([filePath]);

        if (error) {
            throw error;
        }
    } catch (error) {
        throw error;
    }
}