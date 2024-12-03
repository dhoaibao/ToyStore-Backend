import User from '../models/User.model.js';

export const create = async (req, res) => {
    try {
        console.log(req.body);
        const user = await User.query().insert(req.body);
        return res.status(201).json(user);
    } catch (error) {
        console.error(error); // Log lỗi chi tiết ra console
        return res.status(500).json({ message: 'Internal Server Error', error: error.message });
    }
};


export const findAll = async (req, res) => {
    try {
        const users = await User.query();
        return res.status(200).json(users);
    } catch (error) {
        return res.status(500).json(error);
    }
};

export const findOne = async (req, res) => {
    try {
        const user = await User.query().findById(req.params.id);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(500).json(error);
    }
};

export const update = async (req, res) => {
    try {
        const user = await User.query().patchAndFetchById(req.params.id, req.body);
        return res.status(200).json(user);
    } catch (error) {
        return res.status(500).json(error);
    }
};

export const remove = async (req, res) => {
    try {
        await User.query().deleteById(req.params.id);
        return res.status(204).send();
    } catch (error) {
        return res.status(500).json(error);
    }
};