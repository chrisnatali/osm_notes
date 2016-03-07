select count(*) num_lines, sum(line_length_m) sum_line_length_m from
  (select way, st_length(way) line_length_m from planet_osm_line where power='line') power_lines;
