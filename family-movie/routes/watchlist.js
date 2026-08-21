import express from "express";
import { authenticate } from "../middleware/authenticate.js";
import { authorizeModification } from "../middleware/authorize.js";
import { 
    getWatchlist,
    addMovie,
    updateMovie,
    deleteMovie
} from "../utils/db.js";

const router = express.Router();

router.use(authenticate);

router.get("/:userId", (req, res) => {
    const userId = Number(req.params.userId);
    const watchlist = getWatchlist(userId);

    if (watchlist === null) {
        return res.status(404).json({ error: "User not found" });
    }

    res.status(200).json(watchlist);
});

router.post("/:userId/movies", authorizeModification, (req, res) => {
    const userId = Number(req.params.userId);
    const movieData = req.body;

    const movie = addMovie(userId, movieData);

    if (movie === null) {
      return res.status(404).json({ error: "User not found" });
    }

    res.status(201).json(movie);
});

router.put("/:userId/movies/:movieId", authorizeModification, (req, res) => {
    const userId = Number(req.params.userId);
    const movieId = Number(req.params.movieId);
    const updates = req.body;

    const updatedMovie = updateMovie(userId, movieId, updates);

    if (updatedMovie === null) {
      return res.status(404).json({ error: "User or movie not found" });
    }

    res.status(200).json(updatedMovie);
});

router.delete("/:userId/movies/:movieId", authorizeModification, (req, res) => {
    const userId = Number(req.params.userId);
    const movieId = Number(req.params.movieId);

    const success = deleteMovie(userId, movieId);

    if (!success) {
      return res.status(404).json({ error: "User or movie not found" });
    }

    res.status(200).json({ message: "Movie deleted successfully" });
});

export default router;
