db.voters.insertOne({
  voter_id: 2,
  full_name: "John Doe",
  email: "john@example.com",
  status: "active",
  region_code: 1,
});

db.candidates.aggregate([
  {
    $lookup: {
      from: "parties",
      localField: "party_id",
      foreignField: "party_id",
      as: "party_details",
    },
  },
]);

db.votes.aggregate([
  {
    $group: {
      _id: "$candidate_id",
      total_votes: { $sum: 1 },
    },
  },
  {
    $lookup: {
      from: "candidates",
      localField: "_id",
      foreignField: "candidate_id",
      as: "candidate_info",
    },
  },
  { $unwind: "$candidate_info" },
  {
    $project: {
      candidate_id: "$_id",
      candidate_name: "$candidate_info.candidate_name",
      total_votes: 1,
      _id: 0,
    },
  },
  { $sort: { total_votes: -1 } },
]);

db.voters.find({ region_code: 1 });
