export function authorizeModification(req, res, next) {
  if (!req.user) {
    return res.status(403).json({ error: "Access denied" });
  }

  const { role, id } = req.user;
  const { userId } = req.params;

  // 1. Parent role has full access
  if (role === "parent") {
    return next();
  }

  // 2. Child role can only access their own user ID
  if (role === "child" && String(userId) === String(id)) {
    return next();
  }

  // 3. Block all other cases (e.g. child modifying another user)
  return res.status(403).json({ error: "Access denied" });
}
