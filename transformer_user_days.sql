select way, osm_user, substring(osm_timestamp from 1 for 10) day_stamp from planet_osm_point where power='transformer';
