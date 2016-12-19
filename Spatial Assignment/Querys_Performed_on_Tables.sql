----------------------------------------------------------------------
--============= Queries performed on people_sust table =============--
----------------------------------------------------------------------


SELECT * FROM people_sust;


--find 5 closest most person to person with id = 1 (located in amberkhana)
--and its not id = 1 as id =1 is in amberkhana. so we have to find top 6
--closest person to amberkhana and exclude one.

select
  b.*
from people_sust a,
  people_sust b
where a.people_id = 1
and b.people_id != 1
and sdo_nn(
  b.person_geo_location,
  a.person_geo_location,
  'sdo_num_res=6') = 'TRUE';



--find 5 closest most person to person with id = 1 (located in amberkhana)
--sort by distance 
select
  b.*,
  sdo_nn_distance (1) distance
from people_sust a,
  people_sust b
where a.people_id = 1
and sdo_nn(
  b.person_geo_location,
  a.person_geo_location,
  'sdo_num_res=5',
  1) = 'TRUE'
order by distance;



-- find everyone within 3 kilometers of amberkhana (id one's position)

SELECT b.* 
FROM people_sust a,
  people_sust b
where a.people_id = 1
and sdo_within_distance (
  b.person_geo_location,
  a.person_geo_location,
  'distance = 3 unit = kilometer') = 'TRUE';




----------------------------------------------------------------------
--========== Queries performed on SYL_RESTAURANTS TABLE ============--
----------------------------------------------------------------------



SELECT * FROM SYL_RESTAURANTS;


-- Return the topological intersection of two geometries.

SELECT SDO_GEOM.SDO_INTERSECTION(c_a.shape, c_c.shape, 0.0001)
   FROM SYL_RESTAURANTS c_a, SYL_RESTAURANTS c_c 
   WHERE c_a.restaurent_name = 'Spicy' AND c_c.restaurent_name = 'Woondal';



-- Do two geometries have any spatial relationship?

SELECT SDO_GEOM.RELATE(c_b.shape, 'anyinteract', c_d.shape, 0.0001)
  FROM SYL_RESTAURANTS c_b, SYL_RESTAURANTS c_d
  WHERE c_b.restaurent_name = 'poppers' AND c_d.restaurent_name = 'Woondal';



-- Return the areas of all restaurents.

SELECT restaurent_name, SDO_GEOM.SDO_AREA(shape, 0.0001) FROM SYL_RESTAURANTS;



-- Return the area of just Pizza Hut.

SELECT c.restaurent_name, SDO_GEOM.SDO_AREA(c.shape, 0.0001) FROM SYL_RESTAURANTS c 
   WHERE c.restaurent_name = 'Pizza Hut';



-- Return the distance between two geometries.

SELECT SDO_GEOM.SDO_DISTANCE(c_b.shape, c_d.shape, 0.0001)
   FROM SYL_RESTAURANTS c_b, SYL_RESTAURANTS c_d
   WHERE c_b.restaurent_name = 'Palki' AND c_d.restaurent_name = 'Rongdhonu';



-- Is a geometry valid?

SELECT c.restaurent_name, SDO_GEOM.VALIDATE_GEOMETRY_WITH_CONTEXT(c.shape, 0.0001)
   FROM SYL_RESTAURANTS c WHERE c.restaurent_name = 'Dawatkhana';



-- Is a layer valid? (First, create the results table.)

CREATE TABLE val_results (sdo_rowid ROWID, result VARCHAR2(2000));
CALL SDO_GEOM.VALIDATE_LAYER_WITH_CONTEXT('SYL_RESTAURANTS', 'SHAPE', 
  'VAL_RESULTS', 2);
SELECT * from val_results;
