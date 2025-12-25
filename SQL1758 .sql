select distinct a1.Title from Artworks a1
join Exhibitions e1 on e1.ArtworkID = a1.ArtworkID
where e1.ExhibitionID in (
  select e2.ExhibitionID from Exhibitions e2
  join Artworks a2 on e2.ArtworkID = a2.ArtworkID
  where a2.Title = 'Sunflowers'
)
and a1.Title != 'Sunflowers'