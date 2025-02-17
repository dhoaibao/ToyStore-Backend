import supabase from "../config/supabaseConfig.js";
import { decode } from "base64-arraybuffer";

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