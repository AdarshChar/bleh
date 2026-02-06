-- PostgreSQL Schema Conversion from MySQL
-- Database: skyit_demo_1
-- Converted: 2026-02-05

-- Start transaction
BEGIN;

-- Drop tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS django_migrations CASCADE;
DROP TABLE IF EXISTS api_usertablelayoutmodel CASCADE;
DROP TABLE IF EXISTS api_userconfiguration CASCADE;
DROP TABLE IF EXISTS api_transferfile CASCADE;
DROP TABLE IF EXISTS api_snapshotdailylocationcounts CASCADE;
DROP TABLE IF EXISTS api_snapshotdailylocationcost CASCADE;
DROP TABLE IF EXISTS api_snapshotdailycurrency CASCADE;
DROP TABLE IF EXISTS api_snapshotdailycounts CASCADE;
DROP TABLE IF EXISTS api_snapshotdailyasset CASCADE;
DROP TABLE IF EXISTS api_rolepermissions CASCADE;
DROP TABLE IF EXISTS api_requestquote CASCADE;
DROP TABLE IF EXISTS api_repairsmodelhistory CASCADE;
DROP TABLE IF EXISTS api_repairsmodel CASCADE;
DROP TABLE IF EXISTS api_repairfile CASCADE;
DROP TABLE IF EXISTS api_rentalcostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_rentalcost CASCADE;
DROP TABLE IF EXISTS api_partsmodelhistory CASCADE;
DROP TABLE IF EXISTS api_parts CASCADE;
DROP TABLE IF EXISTS api_notificationconfiguration CASCADE;
DROP TABLE IF EXISTS api_maintenancerequestmodelhistory CASCADE;
DROP TABLE IF EXISTS api_maintenancerequestmodel CASCADE;
DROP TABLE IF EXISTS api_maintenancerequestfile CASCADE;
DROP TABLE IF EXISTS api_maintenanceforecastruleshistory CASCADE;
DROP TABLE IF EXISTS api_maintenanceforecastrules CASCADE;
DROP TABLE IF EXISTS api_locationmodel CASCADE;
DROP TABLE IF EXISTS api_licensecostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_licensecost CASCADE;
DROP TABLE IF EXISTS api_laborcostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_laborcost CASCADE;
DROP TABLE IF EXISTS api_jobspecification CASCADE;
DROP TABLE IF EXISTS api_inventory CASCADE;
DROP TABLE IF EXISTS api_insurancecostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_insurancecost CASCADE;
DROP TABLE IF EXISTS api_inspectiontypemodel CASCADE;
DROP TABLE IF EXISTS api_fueltype CASCADE;
DROP TABLE IF EXISTS api_fuelcostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_fuelcostcheck CASCADE;
DROP TABLE IF EXISTS api_fuelcost CASCADE;
DROP TABLE IF EXISTS api_fuelcard CASCADE;
DROP TABLE IF EXISTS api_fleetguru CASCADE;
DROP TABLE IF EXISTS api_errorreportfile CASCADE;
DROP TABLE IF EXISTS api_errorreport CASCADE;
DROP TABLE IF EXISTS api_equipmenttypemodel CASCADE;
DROP TABLE IF EXISTS api_enginemodel CASCADE;
DROP TABLE IF EXISTS api_enginehistorymodel CASCADE;
DROP TABLE IF EXISTS api_detailedusermodelhistory CASCADE;
DROP TABLE IF EXISTS api_detaileduser_location CASCADE;
DROP TABLE IF EXISTS api_detaileduser CASCADE;
DROP TABLE IF EXISTS api_deliverycosthistory CASCADE;
DROP TABLE IF EXISTS api_deliverycost CASCADE;
DROP TABLE IF EXISTS api_dailyinspectionhistory CASCADE;
DROP TABLE IF EXISTS api_dailyinspection CASCADE;
DROP TABLE IF EXISTS api_currency CASCADE;
DROP TABLE IF EXISTS api_costcentremodel CASCADE;
DROP TABLE IF EXISTS api_company CASCADE;
DROP TABLE IF EXISTS api_businessunitmodel CASCADE;
DROP TABLE IF EXISTS api_assettypecheckshistory CASCADE;
DROP TABLE IF EXISTS api_assettypechecks CASCADE;
DROP TABLE IF EXISTS api_assettypemodel CASCADE;
DROP TABLE IF EXISTS api_assettransfermodelhistory CASCADE;
DROP TABLE IF EXISTS api_assettransfer CASCADE;
DROP TABLE IF EXISTS api_assetrequestmodelhistory CASCADE;
DROP TABLE IF EXISTS api_assetrequestmodel CASCADE;
DROP TABLE IF EXISTS api_assetrequestjustificationmodel CASCADE;
DROP TABLE IF EXISTS api_assetrequestfile CASCADE;
DROP TABLE IF EXISTS api_assetmodelhistory CASCADE;
DROP TABLE IF EXISTS api_assetmodel CASCADE;
DROP TABLE IF EXISTS api_assetmanufacturermodel_asset_type CASCADE;
DROP TABLE IF EXISTS api_assetmanufacturermodel CASCADE;
DROP TABLE IF EXISTS api_assetlog CASCADE;
DROP TABLE IF EXISTS api_assetissuemodelhistory CASCADE;
DROP TABLE IF EXISTS api_assetissuemodel CASCADE;
DROP TABLE IF EXISTS api_assetissuefilemodel CASCADE;
DROP TABLE IF EXISTS api_assetissuecategory CASCADE;
DROP TABLE IF EXISTS api_assetfile CASCADE;
DROP TABLE IF EXISTS api_assetdisposalmodelhistory CASCADE;
DROP TABLE IF EXISTS api_assetdisposalmodel CASCADE;
DROP TABLE IF EXISTS api_assetdisposalfile CASCADE;
DROP TABLE IF EXISTS api_assetdailychecksmodelhistory CASCADE;
DROP TABLE IF EXISTS api_assetdailychecksmodel CASCADE;
DROP TABLE IF EXISTS api_assetdailycheckscomment CASCADE;
DROP TABLE IF EXISTS api_approvedvendorsmodel_vendor_services CASCADE;
DROP TABLE IF EXISTS api_approvedvendorsmodel CASCADE;
DROP TABLE IF EXISTS api_approvedvendorservices CASCADE;
DROP TABLE IF EXISTS api_approvedvendorrequest CASCADE;
DROP TABLE IF EXISTS api_approvedvendordepartments CASCADE;
DROP TABLE IF EXISTS api_approvalmodelhistory CASCADE;
DROP TABLE IF EXISTS api_approval CASCADE;
DROP TABLE IF EXISTS api_annualreport CASCADE;
DROP TABLE IF EXISTS api_acquisitioncostmodelhistory CASCADE;
DROP TABLE IF EXISTS api_acquisitioncost CASCADE;
DROP TABLE IF EXISTS api_accidentmodelhistory CASCADE;
DROP TABLE IF EXISTS api_accidentmodel CASCADE;
DROP TABLE IF EXISTS api_accidentfilemodel CASCADE;

-- Create tables

-- Currency table (no dependencies)
CREATE TABLE api_currency (
  id SERIAL PRIMARY KEY,
  code VARCHAR(50) NOT NULL,
  number VARCHAR(50) NOT NULL,
  name VARCHAR(50) NOT NULL
);

-- Location model (no dependencies)
CREATE TABLE api_locationmodel (
  location_id SERIAL PRIMARY KEY,
  location_code VARCHAR(10) NOT NULL,
  location_name VARCHAR(100) NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL
);

-- Company table
CREATE TABLE api_company (
  company_id CHAR(32) PRIMARY KEY,
  company_name VARCHAR(150) NOT NULL,
  company_address VARCHAR(150) NOT NULL,
  company_phone VARCHAR(50) NOT NULL,
  accounting_email VARCHAR(254) NOT NULL UNIQUE,
  software_logo VARCHAR(1000) NOT NULL,
  software_name VARCHAR(50) NOT NULL,
  standard_currency_id INTEGER REFERENCES api_currency(id)
);

-- Business unit model
CREATE TABLE api_businessunitmodel (
  business_unit_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  accounting_email VARCHAR(254) NOT NULL,
  location_id INTEGER NOT NULL REFERENCES api_locationmodel(location_id)
);

-- Cost centre model
CREATE TABLE api_costcentremodel (
  cost_centre_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Role permissions
CREATE TABLE api_rolepermissions (
  id SERIAL PRIMARY KEY,
  role VARCHAR(50) NOT NULL,
  dashboard BOOLEAN NOT NULL,
  dashboard_operator BOOLEAN NOT NULL,
  fleet_at_a_glance BOOLEAN NOT NULL,
  fleet_at_a_glance_executive BOOLEAN NOT NULL,
  fleet_at_a_glance_manager BOOLEAN NOT NULL,
  fleet_overview BOOLEAN NOT NULL,
  asset_request BOOLEAN NOT NULL,
  asset_request_new_order BOOLEAN NOT NULL,
  asset_request_list BOOLEAN NOT NULL,
  repairs BOOLEAN NOT NULL,
  repairs_list BOOLEAN NOT NULL,
  repairs_new_request BOOLEAN NOT NULL,
  maintenance BOOLEAN NOT NULL,
  maintenance_status BOOLEAN NOT NULL,
  maintenance_new_request BOOLEAN NOT NULL,
  maintenance_forecast BOOLEAN NOT NULL,
  maintenance_lookup BOOLEAN NOT NULL,
  incidents BOOLEAN NOT NULL,
  incidents_list BOOLEAN NOT NULL,
  incidents_new_report BOOLEAN NOT NULL,
  issues BOOLEAN NOT NULL,
  issues_new BOOLEAN NOT NULL,
  issues_list BOOLEAN NOT NULL,
  issues_search BOOLEAN NOT NULL,
  operators BOOLEAN NOT NULL,
  operators_daily_check BOOLEAN NOT NULL,
  operators_search BOOLEAN NOT NULL,
  unfinished_checks BOOLEAN NOT NULL,
  energy BOOLEAN NOT NULL,
  energy_fuel_tracking BOOLEAN NOT NULL,
  fuel_orders BOOLEAN NOT NULL,
  fuel_transactions BOOLEAN NOT NULL,
  asset_removal BOOLEAN NOT NULL,
  asset_removal_new BOOLEAN NOT NULL,
  asset_removal_list BOOLEAN NOT NULL,
  approval_request BOOLEAN NOT NULL,
  asset_transfers BOOLEAN NOT NULL,
  asset_transfers_current_transfers BOOLEAN NOT NULL,
  asset_transfers_new_transfer_request BOOLEAN NOT NULL,
  asset_transfers_map BOOLEAN NOT NULL,
  asset_log BOOLEAN NOT NULL
);

-- Detailed user
CREATE TABLE api_detaileduser (
  detailed_user_id SERIAL PRIMARY KEY,
  email VARCHAR(254) NOT NULL UNIQUE,
  cost_allowance INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  agreement_accepted BOOLEAN NOT NULL,
  first_time_login BOOLEAN NOT NULL,
  business_unit_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  company_id CHAR(32) REFERENCES api_company(company_id),
  role_permissions_id INTEGER REFERENCES api_rolepermissions(id),
  cost_centre_id INTEGER REFERENCES api_costcentremodel(cost_centre_id)
);

-- Detailed user location (many-to-many)
CREATE TABLE api_detaileduser_location (
  id SERIAL PRIMARY KEY,
  detaileduser_id INTEGER NOT NULL REFERENCES api_detaileduser(detailed_user_id),
  locationmodel_id INTEGER NOT NULL REFERENCES api_locationmodel(location_id),
  UNIQUE(detaileduser_id, locationmodel_id)
);

-- Fuel type
CREATE TABLE api_fueltype (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Job specification
CREATE TABLE api_jobspecification (
  job_specification_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Asset type checks
CREATE TABLE api_assettypechecks (
  id SERIAL PRIMARY KEY,
  asset_type_name VARCHAR(100) NOT NULL UNIQUE,
  tires BOOLEAN NOT NULL,
  wheels BOOLEAN NOT NULL,
  horn BOOLEAN NOT NULL,
  fuel BOOLEAN NOT NULL,
  mirrors BOOLEAN NOT NULL,
  glass BOOLEAN NOT NULL,
  overhead_guard BOOLEAN NOT NULL,
  steps BOOLEAN NOT NULL,
  forks BOOLEAN NOT NULL,
  operator_cab BOOLEAN NOT NULL,
  cosmetic_damage BOOLEAN NOT NULL,
  brakes BOOLEAN NOT NULL,
  steering BOOLEAN NOT NULL,
  attachments BOOLEAN NOT NULL,
  mud_flaps BOOLEAN NOT NULL,
  electrical_connectors BOOLEAN NOT NULL,
  air_pressure BOOLEAN NOT NULL,
  boom_extensions BOOLEAN NOT NULL,
  spreader_functions BOOLEAN NOT NULL,
  lights BOOLEAN NOT NULL,
  headlights BOOLEAN NOT NULL,
  backup_lights BOOLEAN NOT NULL,
  trailer_light_cord BOOLEAN NOT NULL,
  fluids BOOLEAN NOT NULL,
  oil BOOLEAN NOT NULL,
  transmission_fluid BOOLEAN NOT NULL,
  steering_fluid BOOLEAN NOT NULL,
  hydraulic_fluid BOOLEAN NOT NULL,
  brake_fluid BOOLEAN NOT NULL,
  safety_equipment BOOLEAN NOT NULL,
  fire_extinguisher BOOLEAN NOT NULL,
  leaks BOOLEAN NOT NULL,
  hydraulic_hoses BOOLEAN NOT NULL,
  trailer_air_lines BOOLEAN NOT NULL,
  other_leaks BOOLEAN NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  anchoring_system BOOLEAN NOT NULL,
  communication BOOLEAN NOT NULL,
  electrical BOOLEAN NOT NULL,
  engine_and_all_mechanical BOOLEAN NOT NULL,
  fuel_systems BOOLEAN NOT NULL,
  lifesaving_equipments BOOLEAN NOT NULL,
  navigation_and_strobe_lights BOOLEAN NOT NULL,
  steering_and_hydraulics BOOLEAN NOT NULL
);

-- Asset type model
CREATE TABLE api_assettypemodel (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  overdue_date_variance INTEGER NOT NULL,
  due_soon_date_variance INTEGER NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  custom_fields TEXT,
  asset_type_checks_id INTEGER REFERENCES api_assettypechecks(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Asset manufacturer model
CREATE TABLE api_assetmanufacturermodel (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Asset manufacturer model asset type (many-to-many)
CREATE TABLE api_assetmanufacturermodel_asset_type (
  id SERIAL PRIMARY KEY,
  assetmanufacturermodel_id INTEGER NOT NULL REFERENCES api_assetmanufacturermodel(id),
  assettypemodel_id INTEGER NOT NULL REFERENCES api_assettypemodel(id),
  UNIQUE(assetmanufacturermodel_id, assettypemodel_id)
);

-- Equipment type model
CREATE TABLE api_equipmenttypemodel (
  equipment_type_id SERIAL PRIMARY KEY,
  model_number VARCHAR(100),
  engine VARCHAR(50),
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  fuel_tank_capacity DOUBLE PRECISION,
  fuel_tank_capacity_unit VARCHAR(50),
  asset_type_id INTEGER REFERENCES api_assettypemodel(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  fuel_id INTEGER REFERENCES api_fueltype(id),
  manufacturer_id INTEGER REFERENCES api_assetmanufacturermodel(id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Asset model
CREATE TABLE api_assetmodel (
  "VIN" VARCHAR(100) PRIMARY KEY,
  jde_department VARCHAR(100),
  status VARCHAR(50) NOT NULL,
  aircraft_compatability VARCHAR(100),
  unit_number VARCHAR(100),
  license_plate VARCHAR(100),
  date_of_manufacture DATE,
  fire_extinguisher_quantity VARCHAR(100),
  fire_extinguisher_inspection_date DATE,
  path VARCHAR(300),
  last_process VARCHAR(50) NOT NULL,
  hours_or_mileage VARCHAR(50) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  mileage_unit VARCHAR(50),
  date_in_service DATE,
  total_cost DOUBLE PRECISION NOT NULL,
  daily_average_hours DOUBLE PRECISION NOT NULL,
  daily_average_mileage DOUBLE PRECISION NOT NULL,
  replacement_hours DOUBLE PRECISION,
  replacement_mileage DOUBLE PRECISION,
  insurance_renewal_date DATE,
  registration_renewal_date DATE,
  load_capacity DOUBLE PRECISION,
  load_capacity_unit VARCHAR(50),
  engine VARCHAR(50),
  colour VARCHAR(50) NOT NULL,
  date_created DATE NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  fuel_tank_capacity DOUBLE PRECISION,
  fuel_tank_capacity_unit VARCHAR(50),
  is_rental BOOLEAN,
  monthly_subscription_cost DOUBLE PRECISION,
  class_code VARCHAR(50),
  asset_description TEXT,
  custom_fields TEXT,
  overdue_date_variance INTEGER NOT NULL,
  due_soon_date_variance INTEGER NOT NULL,
  company_id CHAR(32) REFERENCES api_company(company_id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  current_location_id INTEGER REFERENCES api_locationmodel(location_id),
  department_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  equipment_type_id INTEGER REFERENCES api_equipmenttypemodel(equipment_type_id),
  fuel_id INTEGER REFERENCES api_fueltype(id),
  job_specification_id INTEGER REFERENCES api_jobspecification(job_specification_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  original_location_id INTEGER REFERENCES api_locationmodel(location_id),
  parent_id VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  cost_centre_id INTEGER REFERENCES api_costcentremodel(cost_centre_id),
  lifespan_years INTEGER NOT NULL
);

-- Engine model
CREATE TABLE api_enginemodel (
  engine_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  daily_average_hours DOUBLE PRECISION NOT NULL
);

-- Inspection type model
CREATE TABLE api_inspectiontypemodel (
  id SERIAL PRIMARY KEY,
  inspection_name VARCHAR(50) NOT NULL,
  inspection_code VARCHAR(50) NOT NULL,
  required_at DOUBLE PRECISION
);

-- Approved vendor departments
CREATE TABLE api_approvedvendordepartments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Approved vendor services
CREATE TABLE api_approvedvendorservices (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- Approved vendors model
CREATE TABLE api_approvedvendorsmodel (
  vendor_id SERIAL PRIMARY KEY,
  vendor_name VARCHAR(100) NOT NULL,
  is_vendor_green BOOLEAN NOT NULL,
  phone_number VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  website VARCHAR(1000) NOT NULL,
  primary_email VARCHAR(254) NOT NULL,
  vendor_department_id INTEGER REFERENCES api_approvedvendordepartments(id),
  rating DOUBLE PRECISION NOT NULL,
  vendor_task_id VARCHAR(100)
);

-- Approved vendors model vendor services (many-to-many)
CREATE TABLE api_approvedvendorsmodel_vendor_services (
  id SERIAL PRIMARY KEY,
  approvedvendorsmodel_id INTEGER NOT NULL REFERENCES api_approvedvendorsmodel(vendor_id),
  approvedvendorservices_id INTEGER NOT NULL REFERENCES api_approvedvendorservices(id),
  UNIQUE(approvedvendorsmodel_id, approvedvendorservices_id)
);

-- Asset disposal model
CREATE TABLE api_assetdisposalmodel (
  id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  disposal_type VARCHAR(50) NOT NULL,
  estimated_pickup_date TIMESTAMP,
  vendor_contacted_date TIMESTAMP,
  accounting_contacted_date TIMESTAMP,
  available_pickup_date TIMESTAMP,
  interior_condition VARCHAR(50) NOT NULL,
  interior_condition_details TEXT NOT NULL,
  exterior_condition VARCHAR(50) NOT NULL,
  exterior_condition_details TEXT NOT NULL,
  disposal_reason VARCHAR(50) NOT NULL,
  replacement_reason VARCHAR(50) NOT NULL,
  is_stripped BOOLEAN NOT NULL,
  refurbished BOOLEAN NOT NULL,
  vendor_email VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  estimated_cost DOUBLE PRECISION,
  potential_vendor_ids VARCHAR(1000),
  quote_deadline TIMESTAMP,
  primary_vendor_email VARCHAR(100)
);

-- Accident model
CREATE TABLE api_accidentmodel (
  accident_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  estimated_return_date TIMESTAMP,
  accident_report_completed BOOLEAN NOT NULL,
  is_equipment_failure BOOLEAN NOT NULL,
  notification_ack BOOLEAN NOT NULL,
  evaluation_required BOOLEAN NOT NULL,
  is_resolved BOOLEAN NOT NULL,
  is_preventable BOOLEAN NOT NULL,
  is_operational BOOLEAN NOT NULL,
  date_returned_to_service TIMESTAMP,
  accident_summary TEXT,
  downtime_hours DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Accident file model
CREATE TABLE api_accidentfilemodel (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id)
);

-- Maintenance request model
CREATE TABLE api_maintenancerequestmodel (
  maintenance_id SERIAL PRIMARY KEY,
  work_order VARCHAR(100) NOT NULL,
  in_house BOOLEAN NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  date_completed TIMESTAMP,
  estimated_delivery_date TIMESTAMP,
  requested_delivery_date TIMESTAMP,
  vendor_contacted_date TIMESTAMP,
  available_pickup_date TIMESTAMP,
  vendor_email VARCHAR(100) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  status VARCHAR(50) NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  assigned_vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  inspection_type_id INTEGER NOT NULL REFERENCES api_inspectiontypemodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  description TEXT NOT NULL,
  estimated_cost DOUBLE PRECISION,
  potential_vendor_ids VARCHAR(1000),
  quote_deadline TIMESTAMP,
  vendor_delivery BOOLEAN
);

-- Repairs model
CREATE TABLE api_repairsmodel (
  repair_id SERIAL PRIMARY KEY,
  work_order VARCHAR(100) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  in_house BOOLEAN NOT NULL,
  description TEXT NOT NULL,
  is_refurbishment BOOLEAN NOT NULL,
  requested_delivery_date TIMESTAMP,
  estimated_delivery_date TIMESTAMP,
  available_pickup_date TIMESTAMP,
  date_completed TIMESTAMP,
  down_time DOUBLE PRECISION,
  vendor_contacted_date TIMESTAMP,
  vendor_email VARCHAR(100) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  is_urgent BOOLEAN NOT NULL,
  status VARCHAR(50) NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  estimated_cost DOUBLE PRECISION,
  potential_vendor_ids VARCHAR(1000),
  quote_deadline TIMESTAMP,
  vendor_delivery BOOLEAN
);

-- Asset issue category
CREATE TABLE api_assetissuecategory (
  id SERIAL PRIMARY KEY,
  code VARCHAR(50) NOT NULL,
  name VARCHAR(100) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Asset issue model
CREATE TABLE api_assetissuemodel (
  issue_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  issue_details TEXT,
  issue_title VARCHAR(150) NOT NULL,
  issue_type VARCHAR(50) NOT NULL,
  issue_result VARCHAR(100) NOT NULL,
  is_resolved BOOLEAN NOT NULL,
  issue_created TIMESTAMP NOT NULL,
  issue_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  accident_id_id INTEGER REFERENCES api_accidentmodel(accident_id),
  category_id INTEGER REFERENCES api_assetissuecategory(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

-- Asset daily checks model
CREATE TABLE api_assetdailychecksmodel (
  daily_check_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  operable BOOLEAN NOT NULL,
  mileage DOUBLE PRECISION,
  hours DOUBLE PRECISION,
  is_tagout BOOLEAN NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  tires BOOLEAN,
  wheels BOOLEAN,
  horn BOOLEAN,
  fuel INTEGER,
  mirrors BOOLEAN,
  glass BOOLEAN,
  overhead_guard BOOLEAN,
  steps BOOLEAN,
  forks BOOLEAN,
  operator_cab BOOLEAN,
  cosmetic_damage BOOLEAN,
  brakes BOOLEAN,
  steering BOOLEAN,
  attachments BOOLEAN,
  mud_flaps BOOLEAN,
  electrical_connectors BOOLEAN,
  air_pressure BOOLEAN,
  boom_extensions BOOLEAN,
  spreader_functions BOOLEAN,
  headlights BOOLEAN,
  backup_lights BOOLEAN,
  trailer_light_cord BOOLEAN,
  oil BOOLEAN,
  transmission_fluid BOOLEAN,
  steering_fluid BOOLEAN,
  hydraulic_fluid BOOLEAN,
  brake_fluid BOOLEAN,
  fire_extinguisher BOOLEAN,
  hydraulic_hoses BOOLEAN,
  trailer_air_lines BOOLEAN,
  other_leaks BOOLEAN,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  anchoring_system BOOLEAN,
  communication BOOLEAN,
  electrical BOOLEAN,
  engine_and_all_mechanical BOOLEAN,
  fuel_systems BOOLEAN,
  lifesaving_equipments BOOLEAN,
  navigation_and_strobe_lights BOOLEAN,
  steering_and_hydraulics BOOLEAN
);

-- Asset file
CREATE TABLE api_assetfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  date_created DATE NOT NULL,
  date_modified DATE NOT NULL,
  expiration_date DATE,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Asset request justification model
CREATE TABLE api_assetrequestjustificationmodel (
  justification_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Asset request model
CREATE TABLE api_assetrequestmodel (
  id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  date_required TIMESTAMP NOT NULL,
  estimated_delivery_date TIMESTAMP,
  nonstandard_description TEXT,
  vendor_email VARCHAR(100) NOT NULL,
  status VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  quantity INTEGER NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  business_unit_id INTEGER NOT NULL REFERENCES api_businessunitmodel(business_unit_id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  equipment_id INTEGER NOT NULL REFERENCES api_equipmenttypemodel(equipment_type_id),
  justification_id INTEGER NOT NULL REFERENCES api_assetrequestjustificationmodel(justification_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  cost_centre_id INTEGER REFERENCES api_costcentremodel(cost_centre_id),
  potential_vendor_ids VARCHAR(1000),
  vendor_delivery BOOLEAN,
  date_delivered TIMESTAMP,
  estimated_cost DOUBLE PRECISION,
  quote_deadline TIMESTAMP
);

-- Approval model
CREATE TABLE api_approval (
  approval_id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  deny_reason VARCHAR(10000) NOT NULL,
  is_approved BOOLEAN,
  date_created DATE NOT NULL,
  date_modified DATE NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  approving_user_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  asset_transfer_request_id INTEGER,
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_request_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  repair_request_id INTEGER REFERENCES api_repairsmodel(repair_id),
  requesting_user_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_request_id INTEGER REFERENCES api_assetdisposalmodel(id)
);

-- Asset transfer
CREATE TABLE api_assettransfer (
  asset_transfer_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  justification TEXT NOT NULL,
  status VARCHAR(50) NOT NULL,
  pickup_date DATE,
  longitude DOUBLE PRECISION,
  latitude DOUBLE PRECISION,
  interior_condition VARCHAR(50) NOT NULL,
  interior_condition_details TEXT,
  exterior_condition VARCHAR(50) NOT NULL,
  exterior_condition_details TEXT,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  destination_location_id INTEGER REFERENCES api_locationmodel(location_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  original_location_id INTEGER REFERENCES api_locationmodel(location_id),
  estimated_cost DOUBLE PRECISION,
  potential_vendor_ids VARCHAR(1000),
  quote_deadline TIMESTAMP,
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  vendor_contacted_date TIMESTAMP,
  vendor_email VARCHAR(100) NOT NULL
);

-- Add foreign key for asset_transfer_request_id in approval
ALTER TABLE api_approval 
ADD CONSTRAINT api_approval_asset_transfer_reque_a51ddf9b_fk_api_asset 
FOREIGN KEY (asset_transfer_request_id) REFERENCES api_assettransfer(asset_transfer_id);

-- Parts
CREATE TABLE api_parts (
  id SERIAL PRIMARY KEY,
  part_number VARCHAR(100) NOT NULL,
  part_name VARCHAR(100) NOT NULL,
  quantity INTEGER NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Labor cost
CREATE TABLE api_laborcost (
  id SERIAL PRIMARY KEY,
  base_hourly_rate DOUBLE PRECISION NOT NULL,
  total_base_hours DOUBLE PRECISION NOT NULL,
  overtime_rate DOUBLE PRECISION NOT NULL,
  total_overtime_hours DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Delivery cost
CREATE TABLE api_deliverycost (
  id SERIAL PRIMARY KEY,
  price DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

-- Fuel cost
CREATE TABLE api_fuelcost (
  id SERIAL PRIMARY KEY,
  volume DOUBLE PRECISION NOT NULL,
  volume_unit VARCHAR(50) NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  fuel_type_id INTEGER REFERENCES api_fueltype(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  flagged BOOLEAN NOT NULL
);

-- Fuel cost check
CREATE TABLE api_fuelcostcheck (
  fuel_cost_check_id SERIAL PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  volume_ratio_threshold DOUBLE PRECISION NOT NULL,
  company_id CHAR(32) NOT NULL REFERENCES api_company(company_id),
  cost_ratio_threshold DOUBLE PRECISION NOT NULL,
  cost_ratio_type_id INTEGER REFERENCES api_fueltype(id),
  cost_ratio_units VARCHAR(50)
);

-- Insurance cost
CREATE TABLE api_insurancecost (
  id SERIAL PRIMARY KEY,
  deductible DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- License cost
CREATE TABLE api_licensecost (
  id SERIAL PRIMARY KEY,
  license_registration DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  license_plate_renewal DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Rental cost
CREATE TABLE api_rentalcost (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

-- Acquisition cost
CREATE TABLE api_acquisitioncost (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  administrative_cost DOUBLE PRECISION NOT NULL,
  misc_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Annual report
CREATE TABLE api_annualreport (
  id SERIAL PRIMARY KEY,
  lifesaving_ok BOOLEAN NOT NULL,
  lifesaving_notes TEXT NOT NULL,
  engine_ok BOOLEAN NOT NULL,
  engine_notes TEXT NOT NULL,
  communications_ok BOOLEAN NOT NULL,
  communications_notes TEXT NOT NULL,
  bilge_pump_ok BOOLEAN NOT NULL,
  bilge_pump_notes TEXT NOT NULL,
  steering_controls_ok BOOLEAN NOT NULL,
  steering_controls_notes TEXT NOT NULL,
  hatches_ok BOOLEAN NOT NULL,
  hatches_notes TEXT NOT NULL,
  emergency_drills_ok BOOLEAN NOT NULL,
  emergency_drills_notes TEXT NOT NULL,
  fire_extinguishers_ok BOOLEAN NOT NULL,
  fire_extinguishers_notes TEXT NOT NULL,
  hull_ok BOOLEAN NOT NULL,
  hull_notes TEXT NOT NULL,
  electrical_ok BOOLEAN NOT NULL,
  electrical_notes TEXT NOT NULL,
  lights_ok BOOLEAN NOT NULL,
  lights_notes TEXT NOT NULL,
  fuel_systems_ok BOOLEAN NOT NULL,
  fuel_systems_notes TEXT NOT NULL,
  anchoring_ok BOOLEAN NOT NULL,
  anchoring_notes TEXT NOT NULL,
  guard_rails_lines_ok BOOLEAN NOT NULL,
  guard_rails_lines_notes TEXT NOT NULL,
  crew_qualifications_ok BOOLEAN NOT NULL,
  crew_qualifications_notes TEXT NOT NULL,
  signature_name VARCHAR(100),
  signature_date VARCHAR(100),
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  file_id INTEGER NOT NULL REFERENCES api_assetfile(file_id),
  changed_this_year BOOLEAN NOT NULL,
  damaged_this_year BOOLEAN NOT NULL
);

-- Asset log
CREATE TABLE api_assetlog (
  asset_log_id SERIAL PRIMARY KEY,
  log_type VARCHAR(50) NOT NULL,
  event_type VARCHAR(50),
  event_id VARCHAR(100),
  content TEXT NOT NULL,
  asset_log_created TIMESTAMP NOT NULL,
  asset_log_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Maintenance forecast rules
CREATE TABLE api_maintenanceforecastrules (
  id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  date_created DATE NOT NULL,
  date_updated DATE NOT NULL,
  hour_cycle DOUBLE PRECISION NOT NULL,
  mileage_cycle DOUBLE PRECISION NOT NULL,
  time_cycle DOUBLE PRECISION NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL REFERENCES api_assetmodel("VIN"),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  inspection_type_id INTEGER NOT NULL REFERENCES api_inspectiontypemodel(id),
  location_id INTEGER NOT NULL REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  linked_engine_id INTEGER REFERENCES api_enginemodel(engine_id)
);

-- Error report
CREATE TABLE api_errorreport (
  error_report_id SERIAL PRIMARY KEY,
  issue_type VARCHAR(50) NOT NULL,
  error_title VARCHAR(1000) NOT NULL,
  error_description TEXT NOT NULL,
  steps_to_reproduce TEXT,
  date_created DATE NOT NULL,
  status VARCHAR(50) NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Error report file
CREATE TABLE api_errorreportfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  error_report_id INTEGER NOT NULL REFERENCES api_errorreport(error_report_id)
);

-- Fleet guru
CREATE TABLE api_fleetguru (
  id SERIAL PRIMARY KEY,
  process VARCHAR(50) NOT NULL,
  title VARCHAR(150) NOT NULL,
  description TEXT NOT NULL,
  image_url VARCHAR(150)
);

-- Fuel card
CREATE TABLE api_fuelcard (
  card_id SERIAL PRIMARY KEY,
  expiration DATE,
  is_active BOOLEAN NOT NULL,
  assigned_employee_id VARCHAR(254) REFERENCES api_detaileduser(email),
  business_unit_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  issuer_id VARCHAR(254) REFERENCES api_detaileduser(email)
);

-- Inventory
CREATE TABLE api_inventory (
  id SERIAL PRIMARY KEY,
  serial VARCHAR(255) UNIQUE,
  custom_id VARCHAR(255) UNIQUE,
  inventory_type VARCHAR(255) NOT NULL,
  description TEXT,
  per_unit_cost DOUBLE PRECISION,
  date_of_manufacture DATE,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  equipment_type_id INTEGER REFERENCES api_equipmenttypemodel(equipment_type_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Daily inspection
CREATE TABLE api_dailyinspection (
  id SERIAL PRIMARY KEY,
  "VIN" VARCHAR(17) NOT NULL,
  inspection_date DATE NOT NULL,
  pfd_lifejacket_ledger TEXT,
  throw_bags BOOLEAN NOT NULL,
  heaving_line BOOLEAN NOT NULL,
  liferings BOOLEAN NOT NULL,
  reboarding_device BOOLEAN NOT NULL,
  watertight_flashlight BOOLEAN NOT NULL,
  pyrotechnic_flares BOOLEAN NOT NULL,
  first_aid_kit BOOLEAN NOT NULL,
  engine_working BOOLEAN NOT NULL,
  marine_vhf_radio BOOLEAN NOT NULL,
  police_radio BOOLEAN NOT NULL,
  epirb_registered BOOLEAN NOT NULL,
  bilge_pump_clear BOOLEAN NOT NULL,
  steering_controls_operable BOOLEAN NOT NULL,
  hatches_operable BOOLEAN NOT NULL,
  training_skills_exercised BOOLEAN NOT NULL,
  drills_entered_logbook BOOLEAN NOT NULL,
  emergency_briefings_conducted BOOLEAN NOT NULL,
  fire_extinguishers_inspected BOOLEAN NOT NULL,
  regular_inspections_completed BOOLEAN NOT NULL,
  electrical_inspections_completed BOOLEAN NOT NULL,
  broken_cracked_lenses BOOLEAN NOT NULL,
  lights_functioning BOOLEAN NOT NULL,
  fuel_connections_good BOOLEAN NOT NULL,
  fuel_containers_stored_properly BOOLEAN NOT NULL,
  ground_tackle_inspected BOOLEAN NOT NULL,
  bitter_end_attached BOOLEAN NOT NULL,
  anchor_secured BOOLEAN NOT NULL,
  welds_bolts_screws_good BOOLEAN NOT NULL,
  grab_lines_good BOOLEAN NOT NULL,
  operators_trained BOOLEAN NOT NULL,
  crew_equipment_trained BOOLEAN NOT NULL,
  vessel_damaged_since_last_report BOOLEAN NOT NULL,
  structural_changes_made_since_last_report BOOLEAN NOT NULL,
  date_created DATE NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Notification configuration
CREATE TABLE api_notificationconfiguration (
  id SERIAL PRIMARY KEY,
  name VARCHAR(1000) NOT NULL,
  active BOOLEAN NOT NULL,
  fields TEXT,
  custom_text TEXT,
  triggers TEXT,
  recipient_type VARCHAR(50) NOT NULL,
  users TEXT,
  locations TEXT,
  business_units TEXT,
  roles TEXT,
  date_modified TIMESTAMP NOT NULL,
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

-- Request quote
CREATE TABLE api_requestquote (
  id SERIAL PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  vendor_quote_id VARCHAR(50),
  estimated_cost DOUBLE PRECISION,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  approved_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  disposal_request_id INTEGER REFERENCES api_assetdisposalmodel(id),
  maintenance_request_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  repair_request_id INTEGER REFERENCES api_repairsmodel(repair_id),
  transfer_request_id INTEGER REFERENCES api_assettransfer(asset_transfer_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

-- User configuration
CREATE TABLE api_userconfiguration (
  id SERIAL PRIMARY KEY,
  date_modified TIMESTAMP NOT NULL,
  sound BOOLEAN NOT NULL,
  sound_percentage INTEGER NOT NULL CHECK (sound_percentage >= 0),
  dashboard_layout TEXT,
  table_filter TEXT,
  user_id INTEGER NOT NULL REFERENCES api_detaileduser(detailed_user_id)
);

-- User table layout model
CREATE TABLE api_usertablelayoutmodel (
  id SERIAL PRIMARY KEY,
  key VARCHAR(100) NOT NULL,
  value TEXT,
  user_id INTEGER NOT NULL REFERENCES api_detaileduser(detailed_user_id)
);

-- Snapshot tables
CREATE TABLE api_snapshotdailycounts (
  id SERIAL PRIMARY KEY,
  asset_count INTEGER NOT NULL,
  user_count INTEGER NOT NULL,
  date_created TIMESTAMP NOT NULL
);

CREATE TABLE api_snapshotdailycurrency (
  id SERIAL PRIMARY KEY,
  currency_value DOUBLE PRECISION NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  currency_id INTEGER NOT NULL REFERENCES api_currency(id)
);

CREATE TABLE api_snapshotdailylocationcost (
  id SERIAL PRIMARY KEY,
  location VARCHAR(50) NOT NULL,
  volume_fuel DOUBLE PRECISION NOT NULL,
  volume_unit VARCHAR(50) NOT NULL,
  total_cost_fuel DOUBLE PRECISION NOT NULL,
  taxes_fuel DOUBLE PRECISION NOT NULL,
  deductible DOUBLE PRECISION NOT NULL,
  total_cost_insurance DOUBLE PRECISION NOT NULL,
  total_base_hours DOUBLE PRECISION NOT NULL,
  total_overtime_hours DOUBLE PRECISION NOT NULL,
  total_cost_labor DOUBLE PRECISION NOT NULL,
  taxes_labor DOUBLE PRECISION NOT NULL,
  license_registration_cost DOUBLE PRECISION NOT NULL,
  license_plate_renewal_cost DOUBLE PRECISION NOT NULL,
  total_cost_license DOUBLE PRECISION NOT NULL,
  taxes_license DOUBLE PRECISION NOT NULL,
  total_cost_parts DOUBLE PRECISION NOT NULL,
  taxes_parts DOUBLE PRECISION NOT NULL,
  total_cost_rental DOUBLE PRECISION NOT NULL,
  total_cost_acquisition DOUBLE PRECISION NOT NULL,
  taxes_acquisition DOUBLE PRECISION NOT NULL,
  total_cost_delivery DOUBLE PRECISION NOT NULL,
  taxes_delivery DOUBLE PRECISION NOT NULL,
  currency VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL
);

CREATE TABLE api_snapshotdailylocationcounts (
  id SERIAL PRIMARY KEY,
  active_asset_count INTEGER NOT NULL,
  all_asset_count INTEGER NOT NULL,
  daily_check_count INTEGER NOT NULL,
  location INTEGER NOT NULL,
  date_of_checks DATE NOT NULL,
  date_created TIMESTAMP NOT NULL
);

CREATE TABLE api_snapshotdailyasset (
  id SERIAL PRIMARY KEY,
  "VIN" VARCHAR(100),
  parent VARCHAR(100),
  equipment_type VARCHAR(100),
  company VARCHAR(100),
  jde_department VARCHAR(100),
  original_location VARCHAR(100),
  current_location VARCHAR(100),
  status VARCHAR(50),
  aircraft_compatability VARCHAR(100),
  unit_number VARCHAR(100),
  license_plate VARCHAR(100),
  date_of_manufacture DATE,
  department VARCHAR(100),
  job_specification VARCHAR(100),
  fire_extinguisher_quantity VARCHAR(100),
  fire_extinguisher_inspection_date DATE,
  path VARCHAR(300),
  last_process VARCHAR(50),
  hours_or_mileage VARCHAR(50),
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  mileage_unit VARCHAR(50),
  date_in_service DATE,
  total_cost DOUBLE PRECISION NOT NULL,
  currency VARCHAR(100),
  daily_average_hours DOUBLE PRECISION NOT NULL,
  daily_average_mileage DOUBLE PRECISION NOT NULL,
  replacement_hours DOUBLE PRECISION,
  replacement_mileage DOUBLE PRECISION,
  insurance_renewal_date DATE,
  registration_renewal_date DATE,
  load_capacity DOUBLE PRECISION,
  load_capacity_unit VARCHAR(50),
  fuel VARCHAR(100),
  engine VARCHAR(50),
  colour VARCHAR(50) NOT NULL,
  fuel_tank_capacity DOUBLE PRECISION,
  fuel_tank_capacity_unit VARCHAR(50),
  is_rental BOOLEAN,
  monthly_subscription_cost DOUBLE PRECISION,
  date_created TIMESTAMP NOT NULL
);

-- History tables
CREATE TABLE api_accidentmodelhistory (
  accident_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  estimated_return_date TIMESTAMP,
  accident_report_completed BOOLEAN NOT NULL,
  is_equipment_failure BOOLEAN NOT NULL,
  notification_ack BOOLEAN NOT NULL,
  evaluation_required BOOLEAN NOT NULL,
  is_resolved BOOLEAN NOT NULL,
  is_preventable BOOLEAN NOT NULL,
  is_operational BOOLEAN NOT NULL,
  date_returned_to_service TIMESTAMP,
  accident_summary TEXT,
  downtime_hours DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  accident_id INTEGER NOT NULL REFERENCES api_accidentmodel(accident_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_acquisitioncostmodelhistory (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  administrative_cost DOUBLE PRECISION NOT NULL,
  misc_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  acquisition_cost_id INTEGER REFERENCES api_acquisitioncost(id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_approvalmodelhistory (
  approval_history_id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  deny_reason TEXT NOT NULL,
  is_approved BOOLEAN,
  accident_summary TEXT,
  date TIMESTAMP NOT NULL,
  approval_id INTEGER NOT NULL REFERENCES api_approval(approval_id),
  approving_user_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  asset_transfer_request_id INTEGER REFERENCES api_assettransfer(asset_transfer_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_request_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  repair_request_id INTEGER REFERENCES api_repairsmodel(repair_id),
  requesting_user_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_request_id INTEGER REFERENCES api_assetdisposalmodel(id)
);

CREATE TABLE api_assetdailychecksmodelhistory (
  daily_check_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  operable BOOLEAN NOT NULL,
  mileage DOUBLE PRECISION,
  hours DOUBLE PRECISION,
  is_tagout BOOLEAN NOT NULL,
  date TIMESTAMP NOT NULL,
  tires BOOLEAN,
  wheels BOOLEAN,
  horn BOOLEAN,
  fuel INTEGER,
  mirrors BOOLEAN,
  glass BOOLEAN,
  overhead_guard BOOLEAN,
  steps BOOLEAN,
  forks BOOLEAN,
  operator_cab BOOLEAN,
  cosmetic_damage BOOLEAN,
  brakes BOOLEAN,
  steering BOOLEAN,
  attachments BOOLEAN,
  mud_flaps BOOLEAN,
  electrical_connectors BOOLEAN,
  air_pressure BOOLEAN,
  boom_extensions BOOLEAN,
  spreader_functions BOOLEAN,
  headlights BOOLEAN,
  backup_lights BOOLEAN,
  trailer_light_cord BOOLEAN,
  oil BOOLEAN,
  transmission_fluid BOOLEAN,
  steering_fluid BOOLEAN,
  hydraulic_fluid BOOLEAN,
  brake_fluid BOOLEAN,
  fire_extinguisher BOOLEAN,
  hydraulic_hoses BOOLEAN,
  trailer_air_lines BOOLEAN,
  other_leaks BOOLEAN,
  daily_check_id INTEGER REFERENCES api_assetdailychecksmodel(daily_check_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_assetdailycheckscomment (
  daily_check_comment_id SERIAL PRIMARY KEY,
  comment TEXT NOT NULL,
  "check" VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  daily_check_id INTEGER REFERENCES api_assetdailychecksmodel(daily_check_id)
);

CREATE TABLE api_assetdisposalmodelhistory (
  disposal_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  status VARCHAR(50) NOT NULL,
  disposal_type VARCHAR(50) NOT NULL,
  estimated_pickup_date TIMESTAMP,
  vendor_contacted_date TIMESTAMP,
  accounting_contacted_date TIMESTAMP,
  available_pickup_date TIMESTAMP,
  date TIMESTAMP NOT NULL,
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_assetdisposalfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  expiration_date DATE,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_assetissuefilemodel (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id)
);

CREATE TABLE api_assetissuemodelhistory (
  issue_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  issue_details TEXT,
  issue_title VARCHAR(150) NOT NULL,
  issue_type VARCHAR(50) NOT NULL,
  issue_result VARCHAR(100) NOT NULL,
  is_resolved BOOLEAN NOT NULL,
  date TIMESTAMP NOT NULL,
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id),
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

CREATE TABLE api_assetmodelhistory (
  asset_history_id SERIAL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
  jde_department VARCHAR(100),
  status VARCHAR(50) NOT NULL,
  unit_number VARCHAR(100),
  license_plate VARCHAR(100),
  fire_extinguisher_quantity VARCHAR(100),
  fire_extinguisher_inspection_date VARCHAR(100),
  path VARCHAR(300),
  last_process VARCHAR(50) NOT NULL,
  hours_or_mileage VARCHAR(50) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  mileage_unit VARCHAR(50),
  total_cost DOUBLE PRECISION NOT NULL,
  daily_average_hours DOUBLE PRECISION NOT NULL,
  daily_average_mileage DOUBLE PRECISION NOT NULL,
  replacement_hours DOUBLE PRECISION,
  replacement_mileage DOUBLE PRECISION,
  load_capacity DOUBLE PRECISION,
  load_capacity_unit VARCHAR(50),
  engine VARCHAR(50),
  fuel_tank_capacity DOUBLE PRECISION,
  fuel_tank_capacity_unit VARCHAR(50),
  is_rental BOOLEAN,
  monthly_subscription_cost DOUBLE PRECISION,
  class_code VARCHAR(50),
  asset_description TEXT,
  custom_fields TEXT,
  overdue_date_variance INTEGER NOT NULL,
  due_soon_date_variance INTEGER NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  company_id CHAR(32) REFERENCES api_company(company_id),
  currency_id INTEGER REFERENCES api_currency(id),
  current_location_id INTEGER REFERENCES api_locationmodel(location_id),
  department_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  equipment_type_id INTEGER REFERENCES api_equipmenttypemodel(equipment_type_id),
  fuel_id INTEGER REFERENCES api_fueltype(id),
  job_specification_id INTEGER REFERENCES api_jobspecification(job_specification_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  original_location_id INTEGER REFERENCES api_locationmodel(location_id),
  parent_id VARCHAR(100) REFERENCES api_assetmodel("VIN")
);

CREATE TABLE api_assetrequestfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  expiration_date DATE,
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_assetrequestmodelhistory (
  asset_request_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  date_required TIMESTAMP NOT NULL,
  estimated_delivery_date TIMESTAMP,
  nonstandard_description TEXT,
  vendor_email VARCHAR(100) NOT NULL,
  status VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  quantity INTEGER NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  asset_request_id INTEGER NOT NULL REFERENCES api_assetrequestmodel(id),
  business_unit_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  equipment_id INTEGER REFERENCES api_equipmenttypemodel(equipment_type_id),
  justification_id INTEGER REFERENCES api_assetrequestjustificationmodel(justification_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_assettransfermodelhistory (
  asset_transfer_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  justification TEXT NOT NULL,
  status VARCHAR(50) NOT NULL,
  pickup_date DATE,
  longitude DOUBLE PRECISION,
  latitude DOUBLE PRECISION,
  interior_condition VARCHAR(50),
  interior_condition_details TEXT,
  exterior_condition VARCHAR(50),
  exterior_condition_details TEXT,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  asset_transfer_id INTEGER NOT NULL REFERENCES api_assettransfer(asset_transfer_id),
  destination_location_id INTEGER REFERENCES api_locationmodel(location_id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  original_location_id INTEGER REFERENCES api_locationmodel(location_id)
);

CREATE TABLE api_assettypecheckshistory (
  id SERIAL PRIMARY KEY,
  asset_type_name VARCHAR(100) NOT NULL,
  tires BOOLEAN NOT NULL,
  wheels BOOLEAN NOT NULL,
  horn BOOLEAN NOT NULL,
  fuel BOOLEAN NOT NULL,
  mirrors BOOLEAN NOT NULL,
  glass BOOLEAN NOT NULL,
  overhead_guard BOOLEAN NOT NULL,
  steps BOOLEAN NOT NULL,
  forks BOOLEAN NOT NULL,
  operator_cab BOOLEAN NOT NULL,
  cosmetic_damage BOOLEAN NOT NULL,
  brakes BOOLEAN NOT NULL,
  steering BOOLEAN NOT NULL,
  attachments BOOLEAN NOT NULL,
  mud_flaps BOOLEAN NOT NULL,
  electrical_connectors BOOLEAN NOT NULL,
  air_pressure BOOLEAN NOT NULL,
  boom_extensions BOOLEAN NOT NULL,
  spreader_functions BOOLEAN NOT NULL,
  lights BOOLEAN NOT NULL,
  headlights BOOLEAN NOT NULL,
  backup_lights BOOLEAN NOT NULL,
  trailer_light_cord BOOLEAN NOT NULL,
  fluids BOOLEAN NOT NULL,
  oil BOOLEAN NOT NULL,
  transmission_fluid BOOLEAN NOT NULL,
  steering_fluid BOOLEAN NOT NULL,
  hydraulic_fluid BOOLEAN NOT NULL,
  brake_fluid BOOLEAN NOT NULL,
  safety_equipment BOOLEAN NOT NULL,
  fire_extinguisher BOOLEAN NOT NULL,
  leaks BOOLEAN NOT NULL,
  hydraulic_hoses BOOLEAN NOT NULL,
  trailer_air_lines BOOLEAN NOT NULL,
  other_leaks BOOLEAN NOT NULL,
  date TIMESTAMP NOT NULL,
  asset_type_checks_id INTEGER REFERENCES api_assettypechecks(id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_dailyinspectionhistory (
  id SERIAL PRIMARY KEY,
  "VIN" VARCHAR(17) NOT NULL,
  inspection_date DATE NOT NULL,
  pfd_lifejacket_ledger TEXT,
  throw_bags BOOLEAN NOT NULL,
  heaving_line BOOLEAN NOT NULL,
  liferings BOOLEAN NOT NULL,
  reboarding_device BOOLEAN NOT NULL,
  watertight_flashlight BOOLEAN NOT NULL,
  pyrotechnic_flares BOOLEAN NOT NULL,
  first_aid_kit BOOLEAN NOT NULL,
  engine_working BOOLEAN NOT NULL,
  marine_vhf_radio BOOLEAN NOT NULL,
  police_radio BOOLEAN NOT NULL,
  epirb_registered BOOLEAN NOT NULL,
  bilge_pump_clear BOOLEAN NOT NULL,
  steering_controls_operable BOOLEAN NOT NULL,
  hatches_operable BOOLEAN NOT NULL,
  training_skills_exercised BOOLEAN NOT NULL,
  drills_entered_logbook BOOLEAN NOT NULL,
  emergency_briefings_conducted BOOLEAN NOT NULL,
  fire_extinguishers_inspected BOOLEAN NOT NULL,
  regular_inspections_completed BOOLEAN NOT NULL,
  electrical_inspections_completed BOOLEAN NOT NULL,
  broken_cracked_lenses BOOLEAN NOT NULL,
  lights_functioning BOOLEAN NOT NULL,
  fuel_connections_good BOOLEAN NOT NULL,
  fuel_containers_stored_properly BOOLEAN NOT NULL,
  ground_tackle_inspected BOOLEAN NOT NULL,
  bitter_end_attached BOOLEAN NOT NULL,
  anchor_secured BOOLEAN NOT NULL,
  welds_bolts_screws_good BOOLEAN NOT NULL,
  grab_lines_good BOOLEAN NOT NULL,
  operators_trained BOOLEAN NOT NULL,
  crew_equipment_trained BOOLEAN NOT NULL,
  vessel_damaged_since_last_report BOOLEAN NOT NULL,
  structural_changes_made_since_last_report BOOLEAN NOT NULL
);

CREATE TABLE api_deliverycosthistory (
  id SERIAL PRIMARY KEY,
  price DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  asset_request_id INTEGER REFERENCES api_assetrequestmodel(id),
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  currency_id INTEGER REFERENCES api_currency(id),
  delivery_cost_id INTEGER REFERENCES api_deliverycost(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

CREATE TABLE api_detailedusermodelhistory (
  detailed_user_history_id SERIAL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
  email VARCHAR(254) NOT NULL,
  cost_allowance INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  business_unit_id INTEGER REFERENCES api_businessunitmodel(business_unit_id),
  company_id CHAR(32) REFERENCES api_company(company_id),
  role_permissions_id INTEGER REFERENCES api_rolepermissions(id),
  user_id INTEGER NOT NULL REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_enginehistorymodel (
  engine_history_id SERIAL PRIMARY KEY,
  updated_name VARCHAR(100),
  updated_hours DOUBLE PRECISION,
  action VARCHAR(20) NOT NULL,
  responsible_user_id INTEGER NOT NULL REFERENCES api_detaileduser(detailed_user_id),
  date TIMESTAMP NOT NULL,
  engine_id_id INTEGER REFERENCES api_enginemodel(engine_id),
  responsible_daily_check_id INTEGER REFERENCES api_assetdailychecksmodel(daily_check_id),
  responsible_maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  responsible_repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

CREATE TABLE api_fuelcostmodelhistory (
  id SERIAL PRIMARY KEY,
  volume DOUBLE PRECISION NOT NULL,
  volume_unit VARCHAR(50) NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  currency_id INTEGER REFERENCES api_currency(id),
  fuel_cost_id INTEGER REFERENCES api_fuelcost(id),
  fuel_type_id INTEGER REFERENCES api_fueltype(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_insurancecostmodelhistory (
  id SERIAL PRIMARY KEY,
  deductible DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id),
  currency_id INTEGER REFERENCES api_currency(id),
  insurance_cost_id INTEGER REFERENCES api_insurancecost(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_laborcostmodelhistory (
  id SERIAL PRIMARY KEY,
  base_hourly_rate DOUBLE PRECISION NOT NULL,
  total_base_hours DOUBLE PRECISION NOT NULL,
  overtime_rate DOUBLE PRECISION NOT NULL,
  total_overtime_hours DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  currency_id INTEGER REFERENCES api_currency(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id),
  labor_id INTEGER REFERENCES api_laborcost(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_licensecostmodelhistory (
  id SERIAL PRIMARY KEY,
  license_registration DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  license_plate_renewal DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  currency_id INTEGER REFERENCES api_currency(id),
  license_cost_id INTEGER REFERENCES api_licensecost(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_maintenanceforecastruleshistory (
  maintenance_forecast_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  hour_cycle DOUBLE PRECISION NOT NULL,
  mileage_cycle DOUBLE PRECISION NOT NULL,
  time_cycle DOUBLE PRECISION NOT NULL,
  maintenance_forecast_id INTEGER NOT NULL REFERENCES api_maintenanceforecastrules(id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  linked_engine_id INTEGER REFERENCES api_enginemodel(engine_id)
);

CREATE TABLE api_maintenancerequestfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  expiration_date DATE,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  maintenance_request_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_maintenancerequestmodelhistory (
  maintenance_history_id SERIAL PRIMARY KEY,
  work_order VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  date_completed DATE,
  estimated_delivery_date DATE,
  requested_delivery_date DATE,
  vendor_contacted_date DATE,
  available_pickup_date DATE,
  vendor_email VARCHAR(100) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  status VARCHAR(100) NOT NULL,
  assigned_vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id),
  inspection_type_id INTEGER REFERENCES api_inspectiontypemodel(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER NOT NULL REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id)
);

CREATE TABLE api_partsmodelhistory (
  id SERIAL PRIMARY KEY,
  part_number VARCHAR(100) NOT NULL,
  part_name VARCHAR(100) NOT NULL,
  quantity INTEGER NOT NULL,
  price DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  currency_id INTEGER REFERENCES api_currency(id),
  disposal_id INTEGER REFERENCES api_assetdisposalmodel(id),
  issue_id INTEGER REFERENCES api_assetissuemodel(issue_id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  parts_id INTEGER REFERENCES api_parts(id)
);

CREATE TABLE api_rentalcostmodelhistory (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100) REFERENCES api_assetmodel("VIN"),
  accident_id INTEGER REFERENCES api_accidentmodel(accident_id),
  currency_id INTEGER REFERENCES api_currency(id),
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  maintenance_id INTEGER REFERENCES api_maintenancerequestmodel(maintenance_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  rental_cost_id INTEGER REFERENCES api_rentalcost(id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id)
);

CREATE TABLE api_repairfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  expiration_date DATE,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER REFERENCES api_repairsmodel(repair_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_repairsmodelhistory (
  repair_history_id SERIAL PRIMARY KEY,
  work_order VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  description TEXT NOT NULL,
  requested_delivery_date TIMESTAMP,
  estimated_delivery_date TIMESTAMP,
  available_pickup_date TIMESTAMP,
  date_completed TIMESTAMP,
  down_time INTEGER,
  vendor_contacted_date TIMESTAMP,
  vendor_email VARCHAR(100) NOT NULL,
  mileage DOUBLE PRECISION NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  status VARCHAR(100) NOT NULL,
  location_id INTEGER REFERENCES api_locationmodel(location_id),
  modified_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  repair_id INTEGER NOT NULL REFERENCES api_repairsmodel(repair_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_transferfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  created_by_id INTEGER REFERENCES api_detaileduser(detailed_user_id),
  transfer_id INTEGER REFERENCES api_assettransfer(asset_transfer_id),
  vendor_id INTEGER REFERENCES api_approvedvendorsmodel(vendor_id)
);

CREATE TABLE api_approvedvendorrequest (
  id SERIAL PRIMARY KEY,
  vendor_department_id INTEGER REFERENCES api_approvedvendordepartments(id),
  vendor_services_id INTEGER REFERENCES api_approvedvendorservices(id)
);

-- Django migrations table
CREATE TABLE django_migrations (
  id SERIAL PRIMARY KEY,
  app VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  applied TIMESTAMP NOT NULL
);

-- Create indexes for frequently queried fields
CREATE INDEX idx_assetmodel_vin ON api_assetmodel("VIN");
CREATE INDEX idx_assetmodel_status ON api_assetmodel(status);
CREATE INDEX idx_assetmodel_current_location ON api_assetmodel(current_location_id);
CREATE INDEX idx_detaileduser_email ON api_detaileduser(email);
CREATE INDEX idx_accidentmodel_vin ON api_accidentmodel("VIN_id");
CREATE INDEX idx_maintenancerequest_vin ON api_maintenancerequestmodel("VIN_id");
CREATE INDEX idx_repairs_vin ON api_repairsmodel("VIN_id");
CREATE INDEX idx_fuelcost_vin ON api_fuelcost("VIN_id");

COMMIT;