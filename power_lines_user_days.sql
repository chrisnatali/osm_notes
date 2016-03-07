select way, st_length(way) line_length_m, osm_user, substring(osm_timestamp from 1 for 10) day_stamp from planet_osm_line where power='line';
