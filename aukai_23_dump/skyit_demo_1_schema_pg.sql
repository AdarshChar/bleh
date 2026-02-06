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
  standard_currency_id INTEGER
);

-- Business unit model
CREATE TABLE api_businessunitmodel (
  business_unit_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  accounting_email VARCHAR(254) NOT NULL,
  location_id INTEGER NOT NULL
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
  business_unit_id INTEGER,
  company_id CHAR(32),
  role_permissions_id INTEGER,
  cost_centre_id INTEGER
);

-- Detailed user location (many-to-many)
CREATE TABLE api_detaileduser_location (
  id SERIAL PRIMARY KEY,
  detaileduser_id INTEGER NOT NULL,
  locationmodel_id INTEGER NOT NULL,
  UNIQUE(detaileduser_id, locationmodel_id)
);

-- Fuel type
CREATE TABLE api_fueltype (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  created_by_id INTEGER,
  modified_by_id INTEGER
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
  created_by_id INTEGER,
  modified_by_id INTEGER,
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
  asset_type_checks_id INTEGER,
  created_by_id INTEGER,
  modified_by_id INTEGER
);

-- Asset manufacturer model
CREATE TABLE api_assetmanufacturermodel (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_modified TIMESTAMP NOT NULL,
  created_by_id INTEGER,
  modified_by_id INTEGER
);

-- Asset manufacturer model asset type (many-to-many)
CREATE TABLE api_assetmanufacturermodel_asset_type (
  id SERIAL PRIMARY KEY,
  assetmanufacturermodel_id INTEGER NOT NULL,
  assettypemodel_id INTEGER NOT NULL,
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
  asset_type_id INTEGER,
  created_by_id INTEGER,
  fuel_id INTEGER,
  manufacturer_id INTEGER,
  modified_by_id INTEGER
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
  company_id CHAR(32),
  created_by_id INTEGER,
  currency_id INTEGER,
  current_location_id INTEGER,
  department_id INTEGER,
  equipment_type_id INTEGER,
  fuel_id INTEGER,
  job_specification_id INTEGER,
  modified_by_id INTEGER,
  original_location_id INTEGER,
  parent_id VARCHAR(100),
  cost_centre_id INTEGER,
  lifespan_years INTEGER NOT NULL
);

-- Engine model
CREATE TABLE api_enginemodel (
  engine_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  hours DOUBLE PRECISION NOT NULL,
  "VIN_id" VARCHAR(100) NOT NULL,
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
  vendor_department_id INTEGER,
  rating DOUBLE PRECISION NOT NULL,
  vendor_task_id VARCHAR(100)
);

-- Approved vendors model vendor services (many-to-many)
CREATE TABLE api_approvedvendorsmodel_vendor_services (
  id SERIAL PRIMARY KEY,
  approvedvendorsmodel_id INTEGER NOT NULL,
  approvedvendorservices_id INTEGER NOT NULL,
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  vendor_id INTEGER,
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  disposal_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

-- Accident file model
CREATE TABLE api_accidentfilemodel (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  accident_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  assigned_vendor_id INTEGER,
  created_by_id INTEGER,
  inspection_type_id INTEGER NOT NULL,
  location_id INTEGER,
  modified_by_id INTEGER,
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  disposal_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  vendor_id INTEGER,
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
  created_by_id INTEGER,
  modified_by_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  accident_id_id INTEGER,
  category_id INTEGER,
  created_by_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  repair_id_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  modified_by_id INTEGER
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
  "VIN_id" VARCHAR(100),
  business_unit_id INTEGER NOT NULL,
  created_by_id INTEGER,
  disposal_id INTEGER,
  equipment_id INTEGER NOT NULL,
  justification_id INTEGER NOT NULL,
  location_id INTEGER,
  modified_by_id INTEGER,
  vendor_id INTEGER,
  cost_centre_id INTEGER,
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
  "VIN_id" VARCHAR(100),
  approving_user_id INTEGER,
  asset_request_id INTEGER,
  asset_transfer_request_id INTEGER,
  location_id INTEGER,
  maintenance_request_id INTEGER,
  repair_request_id INTEGER,
  requesting_user_id INTEGER,
  disposal_request_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  destination_location_id INTEGER,
  disposal_id INTEGER,
  modified_by_id INTEGER,
  original_location_id INTEGER,
  estimated_cost DOUBLE PRECISION,
  potential_vendor_ids VARCHAR(1000),
  quote_deadline TIMESTAMP,
  vendor_id INTEGER,
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
  created_by_id INTEGER,
  currency_id INTEGER,
  disposal_id INTEGER,
  issue_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER
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
  created_by_id INTEGER,
  currency_id INTEGER,
  disposal_id INTEGER,
  issue_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER
);

-- Delivery cost
CREATE TABLE api_deliverycost (
  id SERIAL PRIMARY KEY,
  price DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  asset_request_id INTEGER,
  created_by_id INTEGER,
  currency_id INTEGER,
  disposal_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER,
  repair_id INTEGER
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
  "VIN_id" VARCHAR(100),
  created_by_id INTEGER,
  currency_id INTEGER,
  fuel_type_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  flagged BOOLEAN NOT NULL
);

-- Fuel cost check
CREATE TABLE api_fuelcostcheck (
  fuel_cost_check_id SERIAL PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  volume_ratio_threshold DOUBLE PRECISION NOT NULL,
  company_id CHAR(32) NOT NULL,
  cost_ratio_threshold DOUBLE PRECISION NOT NULL,
  cost_ratio_type_id INTEGER,
  cost_ratio_units VARCHAR(50)
);

-- Insurance cost
CREATE TABLE api_insurancecost (
  id SERIAL PRIMARY KEY,
  deductible DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  accident_id INTEGER,
  created_by_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
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
  "VIN_id" VARCHAR(100),
  created_by_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

-- Rental cost
CREATE TABLE api_rentalcost (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  accident_id INTEGER,
  created_by_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER,
  repair_id INTEGER
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
  "VIN_id" VARCHAR(100),
  created_by_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  file_id INTEGER NOT NULL,
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
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
  "VIN_id" VARCHAR(100) NOT NULL,
  created_by_id INTEGER,
  inspection_type_id INTEGER NOT NULL,
  location_id INTEGER NOT NULL,
  modified_by_id INTEGER,
  linked_engine_id INTEGER
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
  created_by_id INTEGER
);

-- Error report file
CREATE TABLE api_errorreportfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  error_report_id INTEGER NOT NULL
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
  assigned_employee_id VARCHAR(254),
  business_unit_id INTEGER,
  issuer_id VARCHAR(254)
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
  created_by_id INTEGER,
  equipment_type_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
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
  created_by_id INTEGER,
  modified_by_id INTEGER
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
  modified_by_id INTEGER
);

-- Request quote
CREATE TABLE api_requestquote (
  id SERIAL PRIMARY KEY,
  status VARCHAR(50) NOT NULL,
  vendor_quote_id VARCHAR(50),
  estimated_cost DOUBLE PRECISION,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  approved_by_id INTEGER,
  asset_request_id INTEGER,
  disposal_request_id INTEGER,
  maintenance_request_id INTEGER,
  repair_request_id INTEGER,
  transfer_request_id INTEGER,
  vendor_id INTEGER
);

-- User configuration
CREATE TABLE api_userconfiguration (
  id SERIAL PRIMARY KEY,
  date_modified TIMESTAMP NOT NULL,
  sound BOOLEAN NOT NULL,
  sound_percentage INTEGER NOT NULL CHECK (sound_percentage >= 0),
  dashboard_layout TEXT,
  table_filter TEXT,
  user_id INTEGER NOT NULL
);

-- User table layout model
CREATE TABLE api_usertablelayoutmodel (
  id SERIAL PRIMARY KEY,
  key VARCHAR(100) NOT NULL,
  value TEXT,
  user_id INTEGER NOT NULL
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
  currency_id INTEGER NOT NULL
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
  accident_id INTEGER NOT NULL,
  location_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_acquisitioncostmodelhistory (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  administrative_cost DOUBLE PRECISION NOT NULL,
  misc_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  acquisition_cost_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_approvalmodelhistory (
  approval_history_id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  deny_reason TEXT NOT NULL,
  is_approved BOOLEAN,
  accident_summary TEXT,
  date TIMESTAMP NOT NULL,
  approval_id INTEGER NOT NULL,
  approving_user_id INTEGER,
  asset_request_id INTEGER,
  asset_transfer_request_id INTEGER,
  location_id INTEGER,
  maintenance_request_id INTEGER,
  repair_request_id INTEGER,
  requesting_user_id INTEGER,
  disposal_request_id INTEGER
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
  daily_check_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_assetdailycheckscomment (
  daily_check_comment_id SERIAL PRIMARY KEY,
  comment TEXT NOT NULL,
  "check" VARCHAR(50) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  daily_check_id INTEGER
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
  disposal_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  vendor_id INTEGER
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
  created_by_id INTEGER,
  disposal_id INTEGER,
  vendor_id INTEGER
);

CREATE TABLE api_assetissuefilemodel (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  issue_id INTEGER
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
  accident_id INTEGER,
  issue_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  repair_id INTEGER
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
  "VIN_id" VARCHAR(100),
  company_id CHAR(32),
  currency_id INTEGER,
  current_location_id INTEGER,
  department_id INTEGER,
  equipment_type_id INTEGER,
  fuel_id INTEGER,
  job_specification_id INTEGER,
  modified_by_id INTEGER,
  original_location_id INTEGER,
  parent_id VARCHAR(100)
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
  asset_request_id INTEGER,
  created_by_id INTEGER,
  vendor_id INTEGER
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
  "VIN_id" VARCHAR(100),
  asset_request_id INTEGER NOT NULL,
  business_unit_id INTEGER,
  equipment_id INTEGER,
  justification_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER,
  vendor_id INTEGER
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
  asset_transfer_id INTEGER NOT NULL,
  destination_location_id INTEGER,
  disposal_id INTEGER,
  modified_by_id INTEGER,
  original_location_id INTEGER
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
  asset_type_checks_id INTEGER,
  modified_by_id INTEGER
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
  asset_request_id INTEGER,
  created_by_id INTEGER,
  currency_id INTEGER,
  delivery_cost_id INTEGER,
  disposal_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER,
  repair_id INTEGER
);

CREATE TABLE api_detailedusermodelhistory (
  detailed_user_history_id SERIAL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
  email VARCHAR(254) NOT NULL,
  cost_allowance INTEGER NOT NULL,
  image_url TEXT NOT NULL,
  business_unit_id INTEGER,
  company_id CHAR(32),
  role_permissions_id INTEGER,
  user_id INTEGER NOT NULL
);

CREATE TABLE api_enginehistorymodel (
  engine_history_id SERIAL PRIMARY KEY,
  updated_name VARCHAR(100),
  updated_hours DOUBLE PRECISION,
  action VARCHAR(20) NOT NULL,
  responsible_user_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  engine_id_id INTEGER,
  responsible_daily_check_id INTEGER,
  responsible_maintenance_id INTEGER,
  responsible_repair_id INTEGER
);

CREATE TABLE api_fuelcostmodelhistory (
  id SERIAL PRIMARY KEY,
  volume DOUBLE PRECISION NOT NULL,
  volume_unit VARCHAR(50) NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  currency_id INTEGER,
  fuel_cost_id INTEGER,
  fuel_type_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_insurancecostmodelhistory (
  id SERIAL PRIMARY KEY,
  deductible DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  accident_id INTEGER,
  currency_id INTEGER,
  insurance_cost_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
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
  currency_id INTEGER,
  disposal_id INTEGER,
  issue_id INTEGER,
  labor_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_licensecostmodelhistory (
  id SERIAL PRIMARY KEY,
  license_registration DOUBLE PRECISION NOT NULL,
  taxes DOUBLE PRECISION NOT NULL,
  license_plate_renewal DOUBLE PRECISION NOT NULL,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  currency_id INTEGER,
  license_cost_id INTEGER,
  location_id INTEGER,
  modified_by_id INTEGER
);

CREATE TABLE api_maintenanceforecastruleshistory (
  maintenance_forecast_history_id SERIAL PRIMARY KEY,
  custom_id VARCHAR(100) NOT NULL,
  date TIMESTAMP NOT NULL,
  hour_cycle DOUBLE PRECISION NOT NULL,
  mileage_cycle DOUBLE PRECISION NOT NULL,
  time_cycle DOUBLE PRECISION NOT NULL,
  maintenance_forecast_id INTEGER NOT NULL,
  modified_by_id INTEGER,
  linked_engine_id INTEGER
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
  created_by_id INTEGER,
  maintenance_request_id INTEGER,
  vendor_id INTEGER
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
  assigned_vendor_id INTEGER,
  inspection_type_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER NOT NULL,
  modified_by_id INTEGER
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
  currency_id INTEGER,
  disposal_id INTEGER,
  issue_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER,
  parts_id INTEGER
);

CREATE TABLE api_rentalcostmodelhistory (
  id SERIAL PRIMARY KEY,
  total_cost DOUBLE PRECISION NOT NULL,
  date TIMESTAMP NOT NULL,
  "VIN_id" VARCHAR(100),
  accident_id INTEGER,
  currency_id INTEGER,
  location_id INTEGER,
  maintenance_id INTEGER,
  modified_by_id INTEGER,
  rental_cost_id INTEGER,
  repair_id INTEGER
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
  created_by_id INTEGER,
  repair_id INTEGER,
  vendor_id INTEGER
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
  location_id INTEGER,
  modified_by_id INTEGER,
  repair_id INTEGER NOT NULL,
  vendor_id INTEGER
);

CREATE TABLE api_transferfile (
  file_id SERIAL PRIMARY KEY,
  file_type VARCHAR(150) NOT NULL,
  file_name TEXT NOT NULL,
  file_url TEXT NOT NULL,
  bytes BIGINT NOT NULL,
  file_created TIMESTAMP NOT NULL,
  file_purpose VARCHAR(50) NOT NULL,
  created_by_id INTEGER,
  transfer_id INTEGER,
  vendor_id INTEGER
);

CREATE TABLE api_approvedvendorrequest (
  id SERIAL PRIMARY KEY,
  vendor_department_id INTEGER,
  vendor_services_id INTEGER
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

-- Foreign key constraints
ALTER TABLE "api_company" ADD CONSTRAINT "api_company_standard_currency_id_fkey" FOREIGN KEY (standard_currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_businessunitmodel" ADD CONSTRAINT "api_businessunitmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_detaileduser" ADD CONSTRAINT "api_detaileduser_business_unit_id_fkey" FOREIGN KEY (business_unit_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_detaileduser" ADD CONSTRAINT "api_detaileduser_company_id_fkey" FOREIGN KEY (company_id) REFERENCES api_company(company_id);
ALTER TABLE "api_detaileduser" ADD CONSTRAINT "api_detaileduser_role_permissions_id_fkey" FOREIGN KEY (role_permissions_id) REFERENCES api_rolepermissions(id);
ALTER TABLE "api_detaileduser" ADD CONSTRAINT "api_detaileduser_cost_centre_id_fkey" FOREIGN KEY (cost_centre_id) REFERENCES api_costcentremodel(cost_centre_id);
ALTER TABLE "api_detaileduser_location" ADD CONSTRAINT "api_detaileduser_location_detaileduser_id_fkey" FOREIGN KEY (detaileduser_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_detaileduser_location" ADD CONSTRAINT "api_detaileduser_location_locationmodel_id_fkey" FOREIGN KEY (locationmodel_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_fueltype" ADD CONSTRAINT "api_fueltype_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_fueltype" ADD CONSTRAINT "api_fueltype_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettypechecks" ADD CONSTRAINT "api_assettypechecks_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettypechecks" ADD CONSTRAINT "api_assettypechecks_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettypemodel" ADD CONSTRAINT "api_assettypemodel_asset_type_checks_id_fkey" FOREIGN KEY (asset_type_checks_id) REFERENCES api_assettypechecks(id);
ALTER TABLE "api_assettypemodel" ADD CONSTRAINT "api_assettypemodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettypemodel" ADD CONSTRAINT "api_assettypemodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmanufacturermodel" ADD CONSTRAINT "api_assetmanufacturermodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmanufacturermodel" ADD CONSTRAINT "api_assetmanufacturermodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmanufacturermodel_asset_type" ADD CONSTRAINT "api_assetmanufacturermodel_asset_type_assetmanufacturermodel_id_fkey" FOREIGN KEY (assetmanufacturermodel_id) REFERENCES api_assetmanufacturermodel(id);
ALTER TABLE "api_assetmanufacturermodel_asset_type" ADD CONSTRAINT "api_assetmanufacturermodel_asset_type_assettypemodel_id_fkey" FOREIGN KEY (assettypemodel_id) REFERENCES api_assettypemodel(id);
ALTER TABLE "api_equipmenttypemodel" ADD CONSTRAINT "api_equipmenttypemodel_asset_type_id_fkey" FOREIGN KEY (asset_type_id) REFERENCES api_assettypemodel(id);
ALTER TABLE "api_equipmenttypemodel" ADD CONSTRAINT "api_equipmenttypemodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_equipmenttypemodel" ADD CONSTRAINT "api_equipmenttypemodel_fuel_id_fkey" FOREIGN KEY (fuel_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_equipmenttypemodel" ADD CONSTRAINT "api_equipmenttypemodel_manufacturer_id_fkey" FOREIGN KEY (manufacturer_id) REFERENCES api_assetmanufacturermodel(id);
ALTER TABLE "api_equipmenttypemodel" ADD CONSTRAINT "api_equipmenttypemodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_company_id_fkey" FOREIGN KEY (company_id) REFERENCES api_company(company_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_current_location_id_fkey" FOREIGN KEY (current_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_department_id_fkey" FOREIGN KEY (department_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_equipment_type_id_fkey" FOREIGN KEY (equipment_type_id) REFERENCES api_equipmenttypemodel(equipment_type_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_fuel_id_fkey" FOREIGN KEY (fuel_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_job_specification_id_fkey" FOREIGN KEY (job_specification_id) REFERENCES api_jobspecification(job_specification_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_original_location_id_fkey" FOREIGN KEY (original_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetmodel" ADD CONSTRAINT "api_assetmodel_cost_centre_id_fkey" FOREIGN KEY (cost_centre_id) REFERENCES api_costcentremodel(cost_centre_id);
ALTER TABLE "api_enginemodel" ADD CONSTRAINT "api_enginemodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_approvedvendorsmodel" ADD CONSTRAINT "api_approvedvendorsmodel_vendor_department_id_fkey" FOREIGN KEY (vendor_department_id) REFERENCES api_approvedvendordepartments(id);
ALTER TABLE "api_approvedvendorsmodel_vendor_services" ADD CONSTRAINT "api_approvedvendorsmodel_vendor_services_approvedvendorsmodel_id_fkey" FOREIGN KEY (approvedvendorsmodel_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_approvedvendorsmodel_vendor_services" ADD CONSTRAINT "api_approvedvendorsmodel_vendor_services_approvedvendorservices_id_fkey" FOREIGN KEY (approvedvendorservices_id) REFERENCES api_approvedvendorservices(id);
ALTER TABLE "api_assetdisposalmodel" ADD CONSTRAINT "api_assetdisposalmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetdisposalmodel" ADD CONSTRAINT "api_assetdisposalmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdisposalmodel" ADD CONSTRAINT "api_assetdisposalmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetdisposalmodel" ADD CONSTRAINT "api_assetdisposalmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdisposalmodel" ADD CONSTRAINT "api_assetdisposalmodel_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_accidentmodel" ADD CONSTRAINT "api_accidentmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_accidentmodel" ADD CONSTRAINT "api_accidentmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_accidentmodel" ADD CONSTRAINT "api_accidentmodel_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_accidentmodel" ADD CONSTRAINT "api_accidentmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_accidentmodel" ADD CONSTRAINT "api_accidentmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_accidentfilemodel" ADD CONSTRAINT "api_accidentfilemodel_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_assigned_vendor_id_fkey" FOREIGN KEY (assigned_vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_inspection_type_id_fkey" FOREIGN KEY (inspection_type_id) REFERENCES api_inspectiontypemodel(id);
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_maintenancerequestmodel" ADD CONSTRAINT "api_maintenancerequestmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_repairsmodel" ADD CONSTRAINT "api_repairsmodel_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assetissuecategory" ADD CONSTRAINT "api_assetissuecategory_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetissuecategory" ADD CONSTRAINT "api_assetissuecategory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_accident_id_id_fkey" FOREIGN KEY (accident_id_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_category_id_fkey" FOREIGN KEY (category_id) REFERENCES api_assetissuecategory(id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetissuemodel" ADD CONSTRAINT "api_assetissuemodel_repair_id_id_fkey" FOREIGN KEY (repair_id_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_assetdailychecksmodel" ADD CONSTRAINT "api_assetdailychecksmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetdailychecksmodel" ADD CONSTRAINT "api_assetdailychecksmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdailychecksmodel" ADD CONSTRAINT "api_assetdailychecksmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetdailychecksmodel" ADD CONSTRAINT "api_assetdailychecksmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetfile" ADD CONSTRAINT "api_assetfile_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetfile" ADD CONSTRAINT "api_assetfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetfile" ADD CONSTRAINT "api_assetfile_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_business_unit_id_fkey" FOREIGN KEY (business_unit_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_equipment_id_fkey" FOREIGN KEY (equipment_id) REFERENCES api_equipmenttypemodel(equipment_type_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_justification_id_fkey" FOREIGN KEY (justification_id) REFERENCES api_assetrequestjustificationmodel(justification_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assetrequestmodel" ADD CONSTRAINT "api_assetrequestmodel_cost_centre_id_fkey" FOREIGN KEY (cost_centre_id) REFERENCES api_costcentremodel(cost_centre_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_approving_user_id_fkey" FOREIGN KEY (approving_user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_maintenance_request_id_fkey" FOREIGN KEY (maintenance_request_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_repair_request_id_fkey" FOREIGN KEY (repair_request_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_requesting_user_id_fkey" FOREIGN KEY (requesting_user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_approval" ADD CONSTRAINT "api_approval_disposal_request_id_fkey" FOREIGN KEY (disposal_request_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_destination_location_id_fkey" FOREIGN KEY (destination_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_original_location_id_fkey" FOREIGN KEY (original_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assettransfer" ADD CONSTRAINT "api_assettransfer_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_parts" ADD CONSTRAINT "api_parts_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_laborcost" ADD CONSTRAINT "api_laborcost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycost" ADD CONSTRAINT "api_deliverycost_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_fuel_type_id_fkey" FOREIGN KEY (fuel_type_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_fuelcost" ADD CONSTRAINT "api_fuelcost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_fuelcostcheck" ADD CONSTRAINT "api_fuelcostcheck_company_id_fkey" FOREIGN KEY (company_id) REFERENCES api_company(company_id);
ALTER TABLE "api_fuelcostcheck" ADD CONSTRAINT "api_fuelcostcheck_cost_ratio_type_id_fkey" FOREIGN KEY (cost_ratio_type_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_insurancecost" ADD CONSTRAINT "api_insurancecost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_licensecost" ADD CONSTRAINT "api_licensecost_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_licensecost" ADD CONSTRAINT "api_licensecost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_licensecost" ADD CONSTRAINT "api_licensecost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_licensecost" ADD CONSTRAINT "api_licensecost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_licensecost" ADD CONSTRAINT "api_licensecost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_rentalcost" ADD CONSTRAINT "api_rentalcost_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_acquisitioncost" ADD CONSTRAINT "api_acquisitioncost_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_acquisitioncost" ADD CONSTRAINT "api_acquisitioncost_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_acquisitioncost" ADD CONSTRAINT "api_acquisitioncost_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_acquisitioncost" ADD CONSTRAINT "api_acquisitioncost_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_acquisitioncost" ADD CONSTRAINT "api_acquisitioncost_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_annualreport" ADD CONSTRAINT "api_annualreport_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_annualreport" ADD CONSTRAINT "api_annualreport_file_id_fkey" FOREIGN KEY (file_id) REFERENCES api_assetfile(file_id);
ALTER TABLE "api_assetlog" ADD CONSTRAINT "api_assetlog_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetlog" ADD CONSTRAINT "api_assetlog_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetlog" ADD CONSTRAINT "api_assetlog_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetlog" ADD CONSTRAINT "api_assetlog_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_inspection_type_id_fkey" FOREIGN KEY (inspection_type_id) REFERENCES api_inspectiontypemodel(id);
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenanceforecastrules" ADD CONSTRAINT "api_maintenanceforecastrules_linked_engine_id_fkey" FOREIGN KEY (linked_engine_id) REFERENCES api_enginemodel(engine_id);
ALTER TABLE "api_errorreport" ADD CONSTRAINT "api_errorreport_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_errorreportfile" ADD CONSTRAINT "api_errorreportfile_error_report_id_fkey" FOREIGN KEY (error_report_id) REFERENCES api_errorreport(error_report_id);
ALTER TABLE "api_fuelcard" ADD CONSTRAINT "api_fuelcard_assigned_employee_id_fkey" FOREIGN KEY (assigned_employee_id) REFERENCES api_detaileduser(email);
ALTER TABLE "api_fuelcard" ADD CONSTRAINT "api_fuelcard_business_unit_id_fkey" FOREIGN KEY (business_unit_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_fuelcard" ADD CONSTRAINT "api_fuelcard_issuer_id_fkey" FOREIGN KEY (issuer_id) REFERENCES api_detaileduser(email);
ALTER TABLE "api_inventory" ADD CONSTRAINT "api_inventory_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_inventory" ADD CONSTRAINT "api_inventory_equipment_type_id_fkey" FOREIGN KEY (equipment_type_id) REFERENCES api_equipmenttypemodel(equipment_type_id);
ALTER TABLE "api_inventory" ADD CONSTRAINT "api_inventory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_inventory" ADD CONSTRAINT "api_inventory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_dailyinspection" ADD CONSTRAINT "api_dailyinspection_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_dailyinspection" ADD CONSTRAINT "api_dailyinspection_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_notificationconfiguration" ADD CONSTRAINT "api_notificationconfiguration_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_approved_by_id_fkey" FOREIGN KEY (approved_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_disposal_request_id_fkey" FOREIGN KEY (disposal_request_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_maintenance_request_id_fkey" FOREIGN KEY (maintenance_request_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_repair_request_id_fkey" FOREIGN KEY (repair_request_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_transfer_request_id_fkey" FOREIGN KEY (transfer_request_id) REFERENCES api_assettransfer(asset_transfer_id);
ALTER TABLE "api_requestquote" ADD CONSTRAINT "api_requestquote_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_userconfiguration" ADD CONSTRAINT "api_userconfiguration_user_id_fkey" FOREIGN KEY (user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_usertablelayoutmodel" ADD CONSTRAINT "api_usertablelayoutmodel_user_id_fkey" FOREIGN KEY (user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_snapshotdailycurrency" ADD CONSTRAINT "api_snapshotdailycurrency_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_accidentmodelhistory" ADD CONSTRAINT "api_accidentmodelhistory_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_accidentmodelhistory" ADD CONSTRAINT "api_accidentmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_accidentmodelhistory" ADD CONSTRAINT "api_accidentmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_acquisitioncostmodelhistory" ADD CONSTRAINT "api_acquisitioncostmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_acquisitioncostmodelhistory" ADD CONSTRAINT "api_acquisitioncostmodelhistory_acquisition_cost_id_fkey" FOREIGN KEY (acquisition_cost_id) REFERENCES api_acquisitioncost(id);
ALTER TABLE "api_acquisitioncostmodelhistory" ADD CONSTRAINT "api_acquisitioncostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_acquisitioncostmodelhistory" ADD CONSTRAINT "api_acquisitioncostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_acquisitioncostmodelhistory" ADD CONSTRAINT "api_acquisitioncostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_approval_id_fkey" FOREIGN KEY (approval_id) REFERENCES api_approval(approval_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_approving_user_id_fkey" FOREIGN KEY (approving_user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_asset_transfer_request_id_fkey" FOREIGN KEY (asset_transfer_request_id) REFERENCES api_assettransfer(asset_transfer_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_maintenance_request_id_fkey" FOREIGN KEY (maintenance_request_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_repair_request_id_fkey" FOREIGN KEY (repair_request_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_requesting_user_id_fkey" FOREIGN KEY (requesting_user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_approvalmodelhistory" ADD CONSTRAINT "api_approvalmodelhistory_disposal_request_id_fkey" FOREIGN KEY (disposal_request_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assetdailychecksmodelhistory" ADD CONSTRAINT "api_assetdailychecksmodelhistory_daily_check_id_fkey" FOREIGN KEY (daily_check_id) REFERENCES api_assetdailychecksmodel(daily_check_id);
ALTER TABLE "api_assetdailychecksmodelhistory" ADD CONSTRAINT "api_assetdailychecksmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetdailychecksmodelhistory" ADD CONSTRAINT "api_assetdailychecksmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdailycheckscomment" ADD CONSTRAINT "api_assetdailycheckscomment_daily_check_id_fkey" FOREIGN KEY (daily_check_id) REFERENCES api_assetdailychecksmodel(daily_check_id);
ALTER TABLE "api_assetdisposalmodelhistory" ADD CONSTRAINT "api_assetdisposalmodelhistory_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assetdisposalmodelhistory" ADD CONSTRAINT "api_assetdisposalmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetdisposalmodelhistory" ADD CONSTRAINT "api_assetdisposalmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdisposalmodelhistory" ADD CONSTRAINT "api_assetdisposalmodelhistory_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assetdisposalfile" ADD CONSTRAINT "api_assetdisposalfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetdisposalfile" ADD CONSTRAINT "api_assetdisposalfile_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assetdisposalfile" ADD CONSTRAINT "api_assetdisposalfile_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assetissuefilemodel" ADD CONSTRAINT "api_assetissuefilemodel_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_assetissuemodelhistory" ADD CONSTRAINT "api_assetissuemodelhistory_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_assetissuemodelhistory" ADD CONSTRAINT "api_assetissuemodelhistory_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_assetissuemodelhistory" ADD CONSTRAINT "api_assetissuemodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetissuemodelhistory" ADD CONSTRAINT "api_assetissuemodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetissuemodelhistory" ADD CONSTRAINT "api_assetissuemodelhistory_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_company_id_fkey" FOREIGN KEY (company_id) REFERENCES api_company(company_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_current_location_id_fkey" FOREIGN KEY (current_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_department_id_fkey" FOREIGN KEY (department_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_equipment_type_id_fkey" FOREIGN KEY (equipment_type_id) REFERENCES api_equipmenttypemodel(equipment_type_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_fuel_id_fkey" FOREIGN KEY (fuel_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_job_specification_id_fkey" FOREIGN KEY (job_specification_id) REFERENCES api_jobspecification(job_specification_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_original_location_id_fkey" FOREIGN KEY (original_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetmodelhistory" ADD CONSTRAINT "api_assetmodelhistory_parent_id_fkey" FOREIGN KEY (parent_id) REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetrequestfile" ADD CONSTRAINT "api_assetrequestfile_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_assetrequestfile" ADD CONSTRAINT "api_assetrequestfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetrequestfile" ADD CONSTRAINT "api_assetrequestfile_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_business_unit_id_fkey" FOREIGN KEY (business_unit_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_equipment_id_fkey" FOREIGN KEY (equipment_id) REFERENCES api_equipmenttypemodel(equipment_type_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_justification_id_fkey" FOREIGN KEY (justification_id) REFERENCES api_assetrequestjustificationmodel(justification_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assetrequestmodelhistory" ADD CONSTRAINT "api_assetrequestmodelhistory_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_assettransfermodelhistory" ADD CONSTRAINT "api_assettransfermodelhistory_asset_transfer_id_fkey" FOREIGN KEY (asset_transfer_id) REFERENCES api_assettransfer(asset_transfer_id);
ALTER TABLE "api_assettransfermodelhistory" ADD CONSTRAINT "api_assettransfermodelhistory_destination_location_id_fkey" FOREIGN KEY (destination_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assettransfermodelhistory" ADD CONSTRAINT "api_assettransfermodelhistory_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_assettransfermodelhistory" ADD CONSTRAINT "api_assettransfermodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_assettransfermodelhistory" ADD CONSTRAINT "api_assettransfermodelhistory_original_location_id_fkey" FOREIGN KEY (original_location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_assettypecheckshistory" ADD CONSTRAINT "api_assettypecheckshistory_asset_type_checks_id_fkey" FOREIGN KEY (asset_type_checks_id) REFERENCES api_assettypechecks(id);
ALTER TABLE "api_assettypecheckshistory" ADD CONSTRAINT "api_assettypecheckshistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_asset_request_id_fkey" FOREIGN KEY (asset_request_id) REFERENCES api_assetrequestmodel(id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_delivery_cost_id_fkey" FOREIGN KEY (delivery_cost_id) REFERENCES api_deliverycost(id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_deliverycosthistory" ADD CONSTRAINT "api_deliverycosthistory_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_detailedusermodelhistory" ADD CONSTRAINT "api_detailedusermodelhistory_business_unit_id_fkey" FOREIGN KEY (business_unit_id) REFERENCES api_businessunitmodel(business_unit_id);
ALTER TABLE "api_detailedusermodelhistory" ADD CONSTRAINT "api_detailedusermodelhistory_company_id_fkey" FOREIGN KEY (company_id) REFERENCES api_company(company_id);
ALTER TABLE "api_detailedusermodelhistory" ADD CONSTRAINT "api_detailedusermodelhistory_role_permissions_id_fkey" FOREIGN KEY (role_permissions_id) REFERENCES api_rolepermissions(id);
ALTER TABLE "api_detailedusermodelhistory" ADD CONSTRAINT "api_detailedusermodelhistory_user_id_fkey" FOREIGN KEY (user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_enginehistorymodel" ADD CONSTRAINT "api_enginehistorymodel_responsible_user_id_fkey" FOREIGN KEY (responsible_user_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_enginehistorymodel" ADD CONSTRAINT "api_enginehistorymodel_engine_id_id_fkey" FOREIGN KEY (engine_id_id) REFERENCES api_enginemodel(engine_id);
ALTER TABLE "api_enginehistorymodel" ADD CONSTRAINT "api_enginehistorymodel_responsible_daily_check_id_fkey" FOREIGN KEY (responsible_daily_check_id) REFERENCES api_assetdailychecksmodel(daily_check_id);
ALTER TABLE "api_enginehistorymodel" ADD CONSTRAINT "api_enginehistorymodel_responsible_maintenance_id_fkey" FOREIGN KEY (responsible_maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_enginehistorymodel" ADD CONSTRAINT "api_enginehistorymodel_responsible_repair_id_fkey" FOREIGN KEY (responsible_repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_fuel_cost_id_fkey" FOREIGN KEY (fuel_cost_id) REFERENCES api_fuelcost(id);
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_fuel_type_id_fkey" FOREIGN KEY (fuel_type_id) REFERENCES api_fueltype(id);
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_fuelcostmodelhistory" ADD CONSTRAINT "api_fuelcostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_insurance_cost_id_fkey" FOREIGN KEY (insurance_cost_id) REFERENCES api_insurancecost(id);
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_insurancecostmodelhistory" ADD CONSTRAINT "api_insurancecostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_labor_id_fkey" FOREIGN KEY (labor_id) REFERENCES api_laborcost(id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_laborcostmodelhistory" ADD CONSTRAINT "api_laborcostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_licensecostmodelhistory" ADD CONSTRAINT "api_licensecostmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_licensecostmodelhistory" ADD CONSTRAINT "api_licensecostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_licensecostmodelhistory" ADD CONSTRAINT "api_licensecostmodelhistory_license_cost_id_fkey" FOREIGN KEY (license_cost_id) REFERENCES api_licensecost(id);
ALTER TABLE "api_licensecostmodelhistory" ADD CONSTRAINT "api_licensecostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_licensecostmodelhistory" ADD CONSTRAINT "api_licensecostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenanceforecastruleshistory" ADD CONSTRAINT "api_maintenanceforecastruleshistory_maintenance_forecast_id_fkey" FOREIGN KEY (maintenance_forecast_id) REFERENCES api_maintenanceforecastrules(id);
ALTER TABLE "api_maintenanceforecastruleshistory" ADD CONSTRAINT "api_maintenanceforecastruleshistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenanceforecastruleshistory" ADD CONSTRAINT "api_maintenanceforecastruleshistory_linked_engine_id_fkey" FOREIGN KEY (linked_engine_id) REFERENCES api_enginemodel(engine_id);
ALTER TABLE "api_maintenancerequestfile" ADD CONSTRAINT "api_maintenancerequestfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_maintenancerequestfile" ADD CONSTRAINT "api_maintenancerequestfile_maintenance_request_id_fkey" FOREIGN KEY (maintenance_request_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_maintenancerequestfile" ADD CONSTRAINT "api_maintenancerequestfile_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_maintenancerequestmodelhistory" ADD CONSTRAINT "api_maintenancerequestmodelhistory_assigned_vendor_id_fkey" FOREIGN KEY (assigned_vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_maintenancerequestmodelhistory" ADD CONSTRAINT "api_maintenancerequestmodelhistory_inspection_type_id_fkey" FOREIGN KEY (inspection_type_id) REFERENCES api_inspectiontypemodel(id);
ALTER TABLE "api_maintenancerequestmodelhistory" ADD CONSTRAINT "api_maintenancerequestmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_maintenancerequestmodelhistory" ADD CONSTRAINT "api_maintenancerequestmodelhistory_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_maintenancerequestmodelhistory" ADD CONSTRAINT "api_maintenancerequestmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_disposal_id_fkey" FOREIGN KEY (disposal_id) REFERENCES api_assetdisposalmodel(id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_issue_id_fkey" FOREIGN KEY (issue_id) REFERENCES api_assetissuemodel(issue_id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_partsmodelhistory" ADD CONSTRAINT "api_partsmodelhistory_parts_id_fkey" FOREIGN KEY (parts_id) REFERENCES api_parts(id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_VIN_id_fkey" FOREIGN KEY ("VIN_id") REFERENCES api_assetmodel("VIN");
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_accident_id_fkey" FOREIGN KEY (accident_id) REFERENCES api_accidentmodel(accident_id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_currency_id_fkey" FOREIGN KEY (currency_id) REFERENCES api_currency(id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_maintenance_id_fkey" FOREIGN KEY (maintenance_id) REFERENCES api_maintenancerequestmodel(maintenance_id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_rental_cost_id_fkey" FOREIGN KEY (rental_cost_id) REFERENCES api_rentalcost(id);
ALTER TABLE "api_rentalcostmodelhistory" ADD CONSTRAINT "api_rentalcostmodelhistory_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_repairfile" ADD CONSTRAINT "api_repairfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_repairfile" ADD CONSTRAINT "api_repairfile_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_repairfile" ADD CONSTRAINT "api_repairfile_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_repairsmodelhistory" ADD CONSTRAINT "api_repairsmodelhistory_location_id_fkey" FOREIGN KEY (location_id) REFERENCES api_locationmodel(location_id);
ALTER TABLE "api_repairsmodelhistory" ADD CONSTRAINT "api_repairsmodelhistory_modified_by_id_fkey" FOREIGN KEY (modified_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_repairsmodelhistory" ADD CONSTRAINT "api_repairsmodelhistory_repair_id_fkey" FOREIGN KEY (repair_id) REFERENCES api_repairsmodel(repair_id);
ALTER TABLE "api_repairsmodelhistory" ADD CONSTRAINT "api_repairsmodelhistory_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_transferfile" ADD CONSTRAINT "api_transferfile_created_by_id_fkey" FOREIGN KEY (created_by_id) REFERENCES api_detaileduser(detailed_user_id);
ALTER TABLE "api_transferfile" ADD CONSTRAINT "api_transferfile_transfer_id_fkey" FOREIGN KEY (transfer_id) REFERENCES api_assettransfer(asset_transfer_id);
ALTER TABLE "api_transferfile" ADD CONSTRAINT "api_transferfile_vendor_id_fkey" FOREIGN KEY (vendor_id) REFERENCES api_approvedvendorsmodel(vendor_id);
ALTER TABLE "api_approvedvendorrequest" ADD CONSTRAINT "api_approvedvendorrequest_vendor_department_id_fkey" FOREIGN KEY (vendor_department_id) REFERENCES api_approvedvendordepartments(id);
ALTER TABLE "api_approvedvendorrequest" ADD CONSTRAINT "api_approvedvendorrequest_vendor_services_id_fkey" FOREIGN KEY (vendor_services_id) REFERENCES api_approvedvendorservices(id);
