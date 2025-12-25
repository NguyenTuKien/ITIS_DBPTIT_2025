select distinct a.title from Artworks a
left join Exhibitions e on e.ArtworkID = a.ArtworkID
where e.ExhibitionID in (
  select e.ExhibitionID from Exhibitions e
  join Artworks a on e.ArtworkID = a.ArtworkID
  where a.title = 'Sunflowers'
)
and a.title != 'Sunflowers'