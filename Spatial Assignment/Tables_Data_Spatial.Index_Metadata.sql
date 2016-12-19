
-- TABLE DECLARATION SYL_RESTAURANTS--

DROP TABLE SYL_RESTAURANTS;

DROP INDEX syl_rest_spatial_idx;

delete from user_sdo_geom_metadata
  where table_name = 'SYL_RESTAURANTS'
  AND column_name = 'shape';

CREATE TABLE syl_restaurants(
  restaurent_id NUMBER PRIMARY KEY,
  restaurent_name VARCHAR2(50),
  shape SDO_GEOMETRY
);


-- UPDATE METADATA VIEW --

INSERT INTO user_sdo_geom_metadata
    (TABLE_NAME,
     COLUMN_NAME,
     DIMINFO,
     SRID)
  VALUES (
  'SYL_RESTAURANTS',
  'shape',
  SDO_DIM_ARRAY(   -- 20X20 grid
    SDO_DIM_ELEMENT('X', 89, 92, 0.0001),
    SDO_DIM_ELEMENT('Y', 24, 25, 0.0001)
     ),
  NULL   -- SRID
);
--UPDATE user_sdo_geom_metadata
--  SET DIMINFO = SDO_DIM_ARRAY(   -- ???
--    SDO_DIM_ELEMENT('X', 0, 20, 0.005),
--    SDO_DIM_ELEMENT('Y', 0, 20, 0.005) 
--     ) WHERE table_name = 'SYL_RESTAURANTS';



-- CREATE THE SPATIAL INDEX --

CREATE INDEX syl_rest_spatial_idx
   ON SYL_RESTAURANTS(shape)
   INDEXTYPE IS MDSYS.SPATIAL_INDEX;



----------------------------------------------------------------------
--==================================================================--
----------------------------------------------------------------------



-- TABLE DECLARATION PEOPLE_SUST--

drop table people_sust;

DROP INDEX people_sust_spatial_idx;

delete from user_sdo_geom_metadata
  where table_name = 'PEOPLE_SUST'
  AND column_name = 'PERSON_GEO_LOCATION';

CREATE TABLE people_sust(
  people_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  person_geo_location SDO_GEOMETRY
);

-- Add metadata to spatial view USER_SDO_GEOM_METADATA.
 
INSERT INTO USER_SDO_GEOM_METADATA (
  TABLE_NAME,
  COLUMN_NAME,
  DIMINFO,
  SRID) 
  VALUES (
  'people_sust',
  'person_geo_location', 
  SDO_DIM_ARRAY(
    SDO_DIM_ELEMENT(
      'LONG',
      -180.0,
      180.0,
      0.5), 
    SDO_DIM_ELEMENT(
      'LAT',
      -90.0,
      90.0,
      0.5)),
    8307);
   
-- CREATE THE SPATIAL INDEX --

CREATE INDEX people_sust_spatial_idx ON people_sust(person_geo_location)
   INDEXTYPE IS mdsys.spatial_index;




----------------------------------------------------------------------
--==================================================================--
----------------------------------------------------------------------


-- Populating PEOPLE_SUST WITH location DATA --

-- person with people_id = 1 is in amberkhana 
insert into people_sust values(
  1,
  'Tanveer',
  'Ahmed',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.869928,
      24.905144,
      null),
    null,
    null
    )
);

insert into people_sust values(
  2,
  'Minhaz',
  'Alam',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.848100,
      24.916371,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  3,
  'Munif',
  'Hasan',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.854875,
      24.911153,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  4,
  'prithbiraj',
  'shourav',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.838339,
      24.908630,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  5,
  'M A',
  'Alim',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.840164,
      24.915122,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  6,
  'S Nabil',
  'Mohammad',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.830888,
      24.918176,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  7,
  'Haider',
  'Ali',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.868277,
      24.886099,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  8,
  'Rokeya',
  'Ahmed',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.878670,
      24.894807,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  9,
  'Siham',
  'Sharif',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.862286,
      24.899029,
      null
    ),
    null,
    null
  )
);

insert into people_sust values(
  10,
  'Samit',
  'haque',
  SDO_GEOMETRY(
    2001,
    8307,
    SDO_POINT_TYPE(
      91.844639,
      24.904758,
      null
    ),
    null,
    null
  )
);



----------------------------------------------------------------------
--==================================================================--
----------------------------------------------------------------------




-- POPULATION WITH DATA SYL_RESTAURANTS--

INSERT INTO SYL_RESTAURANTS VALUES(
  1,
  'Spicy',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.867938, 24.895838,
      91.868337, 24.895823,
      91.868316, 24.895572,
      91.867903, 24.895567)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  2,
  'Palki',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.869681, 24.895009,
      91.869681, 24.895009,
      91.869681, 24.895009,
      91.869502, 24.894691,
      91.869298, 24.894681,
      91.869284, 24.895024)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  3,
  'Woondal',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.870614, 24.895150,
      91.870595, 24.895292,
      91.870653, 24.895610,
      91.870639, 24.895668,
      91.870797, 24.895661,
      91.870794, 24.895558,
      91.870750, 24.895545,
      91.870758, 24.895207
      )
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  4,
  'Poppers',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.871368, 24.895415,
      91.871164, 24.895355,
      91.871130, 24.895449,
      91.871221, 24.895663)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  5,
  'Pizza Hut',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.868284, 24.896483,
      91.868130, 24.896487,
      91.868128, 24.896340,
      91.868161, 24.896276,
      91.868313, 24.896282)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  6,
  'Blue Mango',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.868811, 24.902127,
      91.868814, 24.902207,
      91.869128, 24.902190,
      91.869114, 24.902098)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  7,
  'rainbow chinese',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.871934, 24.899096,
      91.871788, 24.899087,
      91.871780, 24.899192,
      91.871933, 24.899214)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  8,
  'Isti Kutum',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.869511, 24.904399,
      91.869518, 24.904440,
      91.869669, 24.904424,
      91.869667, 24.904383)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  9,
  'Dawatkhana',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.870131, 24.904219,
      91.869794, 24.904265,
      91.869805, 24.904356,
      91.870149, 24.904311)
  )
);

INSERT INTO SYL_RESTAURANTS VALUES(
  10,
  'Rongdhonu',
  SDO_GEOMETRY(
    2003,
    NULL,
    NULL,
    SDO_ELEM_INFO_ARRAY(1,1003,1),
    SDO_ORDINATE_ARRAY(
      91.869841, 24.904663,
      91.870141, 24.904615,
      91.870130, 24.904647,
      91.870017, 24.904750,
      91.869998, 24.904680,
      91.869848, 24.904705)
  )
);
