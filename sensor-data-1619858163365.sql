
CREATE TABLE agents
(
  vin    character varying(255) NOT NULL,
  userid serial                 NOT NULL,
  name   character varying(255) NOT NULL,
  PRIMARY KEY (vin)
);

COMMENT ON TABLE agents IS 'Represents a Vehicle Sensor Agent';

CREATE TABLE sensor
(
  id        serial                   NOT NULL,
  vin       character varying(255)   NOT NULL,
  name      character varying(255)   NOT NULL,
  range     decimal                 ,
  mgpe      decimal                 ,
  battery   decimal                 ,
  speed     decimal                 ,
  latitude  decimal                 ,
  longitude decimal                 ,
  date      timestamp with time zone,
  PRIMARY KEY (id)
);

COMMENT ON TABLE sensor IS 'Sensor Data';

CREATE TABLE users
(
  id       serial                 NOT NULL,
  username character varying(255) NOT NULL,
  password character varying(255) NOT NULL,
  admin    bool                   NOT NULL DEFAULT false,
  PRIMARY KEY (id)
);

COMMENT ON TABLE users IS 'Users for my application';

ALTER TABLE sensor
  ADD CONSTRAINT FK_agents_TO_sensor
    FOREIGN KEY (vin)
    REFERENCES agents (vin);

ALTER TABLE agents
  ADD CONSTRAINT FK_users_TO_agents
    FOREIGN KEY (userid)
    REFERENCES users (id);
