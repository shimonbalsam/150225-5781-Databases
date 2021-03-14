CREATE TABLE city
(
  city_name INT NOT NULL,
  area_id INT NOT NULL,
  PRIMARY KEY (city_name)
);

CREATE TABLE client
(
  client_id INT NOT NULL,
  client_name INT NOT NULL,
  agent_id INT NOT NULL,
  phone_number INT NOT NULL,
  address INT NOT NULL,
  city_name INT NOT NULL,
  PRIMARY KEY (client_id)
);

CREATE TABLE agents
(
  agent_id INT NOT NULL,
  agent_name INT NOT NULL,
  area_id INT NOT NULL,
  rating INT NOT NULL,
  hire_year INT NOT NULL,
  boss_id INT NOT NULL,
  salsry INT NOT NULL,
  client_id INT NOT NULL,
  PRIMARY KEY (agent_id),
  FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE area
(
  area_id INT NOT NULL,
  area_name INT NOT NULL,
  agent_id INT NOT NULL,
  city_name INT NOT NULL,
  PRIMARY KEY (area_id),
  FOREIGN KEY (agent_id) REFERENCES agents(agent_id),
  FOREIGN KEY (city_name) REFERENCES city(city_name)
);

CREATE TABLE meeting
(
  meeting_time INT NOT NULL,
  client_id INT NOT NULL,
  agent_id INT NOT NULL,
  PRIMARY KEY (client_id, agent_id),
  FOREIGN KEY (client_id) REFERENCES client(client_id),
  FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);