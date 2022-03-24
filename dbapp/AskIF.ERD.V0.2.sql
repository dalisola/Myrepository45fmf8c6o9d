BEGIN;

CREATE TABLE "party" (
  "party_id" BIGSERIAL PRIMARY KEY,
  "party_role_id" bigint,
  "title_id" bigint,
  "gender_id" bigint,
  "party_living_arrangement_id" bigint,
  "citizenship_id" bigint,
  "party_uuid" varchar,
  "party_first_name" varchar(150),
  "party_middle_name" varchar(150),
  "party_last_name" varchar(150),
  "party_nickname" varchar,
  "party_suffix" varchar,
  "party_date_of_birth" date,
  "party_email" varchar,
  "party_notes" text,
  "party_is_archived" boolean,
  "party_created_date" timestamp DEFAULT NOW(),
  "party_updated_date" timestamp
);

CREATE TABLE "title" (
  "title_id" BIGSERIAL PRIMARY KEY,
  "title_name" varchar(150),
  "title_description" text,
  "title_created_date" timestamp DEFAULT NOW(),
  "title_updated_date" timestamp
);

CREATE TABLE "gender" (
  "gender_id" BIGSERIAL PRIMARY KEY,
  "gender_name" varchar(150),
  "gender_description" text,
  "gender_created_date" timestamp DEFAULT NOW(),
  "gender_updated_date" timestamp
);

CREATE TABLE "living_arrangement" (
  "living_arrangement_id" BIGSERIAL PRIMARY KEY,
  "living_arrangement_name" varchar(150),
  "living_arrangement_description" text,
  "living_arrangement_created_date" timestamp DEFAULT 'now',
  "living_arrangement_updated_date" timestamp
);

CREATE TABLE "citizenship" (
  "citizenship_id" BIGSERIAL PRIMARY KEY,
  "citizenship_name" varchar(150),
  "citizenship_description" text,
  "citizenship_created_date" timestamp DEFAULT NOW(),
  "citizenship_updated_date" timestamp
);

CREATE TABLE "organization" (
  "organization_id" BIGSERIAL PRIMARY KEY,
  "organization_name" varchar(150),
  "organization_description" text,
  "organization_number" varchar,
  "organization_classification_id" bigint,
  "organization_created_date" timestamp DEFAULT NOW(),
  "organization_updated_date" timestamp
);

CREATE TABLE "party_relationship_type" (
  "party_relationship_type_id" BIGSERIAL PRIMARY KEY,
  "party_relationship_type_name" varchar(150),
  "party_relationship_type_description" text,
  "party_relationship_type_created_date" timestamp DEFAULT NOW(),
  "party_relationship_type_updated_date" timestamp
);

CREATE TABLE "party_relationship" (
  "party_relationship_id" BIGSERIAL PRIMARY KEY,
  "party_relationship_type_id" bigint,
  "party_id" bigint,
  "related_party_id" bigint,
  "organization_id" bigint,
  "party_role_id" int,
  "party_relationship_name" varchar(150),
  "party_relationship_description" text,
  "party_relationship_created_date" timestamp DEFAULT NOW(),
  "party_relationship_updated_date" timestamp
);

CREATE TABLE "party_contact_mechanism" (
  "party_contact_id" BIGSERIAL PRIMARY KEY,
  "party_contact_mechanism_type" bigint,
  "party_id" bigint,
  "organization_id" bigint,
  "party_contact_mechanism_email_address" varchar,
  "party_contact_mechanism_address_line_1" varchar,
  "party_contact_mechanism_address_line_2" varchar,
  "party_contact_mechanism_address_line_3" varchar,
  "party_contact_mechanism_city" varchar,
  "party_contact_mechanism_country" varchar,
  "party_contact_mechanism_postcode" varchar,
  "party_contact_mechanism_country_id" varchar,
  "party_contact_mechanism_mobile_number" varchar,
  "party_contact_mechanism_telephone_number" varchar,
  "party_contact_mechanism_created_date" timestamp DEFAULT NOW(),
  "party_contact_mechanism_updated_date" timestamp
);

CREATE TABLE "communication_event" (
  "communication_event_id" BIGSERIAL PRIMARY KEY,
  "party_contact_id" bigint,
  "communication_event_type" bigint,
  "communication_event_created_date" timestamp DEFAULT NOW(),
  "communication_event_updated_date" timestamp
);

CREATE TABLE "communication_event_type" (
  "communication_event_type_id" BIGSERIAL PRIMARY KEY,
  "communication_event_type_name" varchar(150),
  "communication_event_type_description" text,
  "communication_event_type_created_date" timestamp DEFAULT NOW(),
  "communication_event_type_updated_date" timestamp
);

CREATE TABLE "party_contact_mechanism_type" (
  "party_contact_mechanism_type_id" BIGSERIAL PRIMARY KEY,
  "party_contact_mechanism_type_name" varchar(150),
  "party_contact_mechanism_type_description" text,
  "party_contact_mechanism_type_created_date" timestamp DEFAULT NOW(),
  "party_contact_mechanism_type_updated_date" timestamp
);

CREATE TABLE "party_bank" (
  "party_bank_id" BIGSERIAL PRIMARY KEY,
  "bank_account_id" bigint,
  "party_relationship_id" int,
  "party_bank_created_date" timestamp DEFAULT NOW(),
  "party_bank_updated_date" timestamp
);

CREATE TABLE "bank_account" (
  "bank_account_id" BIGSERIAL PRIMARY KEY,
  "bank_account_bank" varchar,
  "bank_account_sortcode" int,
  "bank_account_account_number" varchar,
  "bank_account_address" text,
  "bank_account_city" varchar,
  "bank_account_created_date" timestamp DEFAULT NOW(),
  "bank_account_updated_date" timestamp
);

CREATE TABLE "party_role" (
  "party_role_id" BIGSERIAL PRIMARY KEY,
  "party_role_name" varchar(150),
  "party_role_description" text,
  "party_role_created_date" timestamp DEFAULT NOW(),
  "party_role_updated_date" timestamp
);

CREATE TABLE "party_agreements" (
  "party_agreements_id" BIGSERIAL PRIMARY KEY,
  "party_id" bigint,
  "party_agreement_type_id" bigint,
  "party_agreements_agreed" boolean,
  "party_agreements_created_date" timestamp DEFAULT NOW(),
  "party_agreements_updated_date" timestamp
);

CREATE TABLE "document_storage" (
  "document_storage_id" BIGSERIAL PRIMARY KEY,
  "party_agreements_id" bigint,
  "document_storage_config" json,
  "document_storage_created_date" timestamp DEFAULT NOW(),
  "document_storage_updated_date" timestamp
);

CREATE TABLE "party_agreement_type" (
  "party_agreement_type_id" BIGSERIAL PRIMARY KEY,
  "party_agreement_type_name" varchar(150),
  "party_agreement_type_description" text,
  "party_agreement_required" boolean,
  "party_agreement_type_created_date" timestamp DEFAULT NOW(),
  "party_agreement_type_updated_date" timestamp
);

CREATE TABLE "product_category" (
  "product_category_id" BIGSERIAL PRIMARY KEY,
  "product_category_parent" bigint,
  "product_category_name" varchar(150),
  "product_category_description" text,
  "product_category_notes" text,
  "product_category_created_date" timestamp DEFAULT NOW(),
  "product_category_updated_date" timestamp
);

CREATE TABLE "product" (
  "product_id" BIGSERIAL PRIMARY KEY,
  "product_type_id" bigint,
  "product_feature_id" bigint,
  "product_category_id" bigint,
  "product_name" varchar(150),
  "product_description" text,
  "product_introduction_date" datetime,
  "product_discontinued_date" datetime,
  "product_support_discontinued_date" datetime,
  "product_created_date" timestamp DEFAULT NOW(),
  "product_updated_date" timestamp
);

CREATE TABLE "product_feature" (
  "product_feature_id" BIGSERIAL PRIMARY KEY,
  "product_feature_name" varchar(150),
  "product_feature_description" text,
  "product_feature_created_date" timestamp DEFAULT NOW(),
  "product_feature_updated_date" timestamp
);

CREATE TABLE "product_type" (
  "product_type_id" BIGSERIAL PRIMARY KEY,
  "product_type_name" varchar(150),
  "product_type_description" text,
  "product_type_created_date" timestamp DEFAULT NOW(),
  "product_type_updated_date" timestamp
);

CREATE TABLE "portfolio" (
  "portfolio_id" BIGSERIAL PRIMARY KEY,
  "organization_id" bigint,
  "product_id" bigint,
  "product_quote_id" bigint,
  "portfolio_assessment_comments" varchar,
  "portfolio_decision_comments" varchar,
  "portfolio_created_date" timestamp DEFAULT NOW(),
  "portfolio_updated_date" timestamp
);

CREATE TABLE "product_quote" (
  "product_quote_id" BIGSERIAL PRIMARY KEY,
  "product_quote_status_id" bigint,
  "product_quote_provenir_data" json,
  "product_quote_psychometric_data" json,
  "product_quote_created_date" timestamp DEFAULT NOW(),
  "product_quote_updated_date" timestamp
);

CREATE TABLE "product_quote_status" (
  "product_quote_status_id" BIGSERIAL PRIMARY KEY,
  "product_quote_status_name" varchar(150),
  "product_quote_status_description" text,
  "product_quote_status_created_date" timestamp DEFAULT NOW(),
  "product_quote_status_updated_date" timestamp
);

CREATE TABLE "authentication_event" (
  "authentication_event_id" BIGSERIAL PRIMARY KEY,
  "product_quote_id" bigint,
  "product_quote_status_id" bigint,
  "authentication_event_type" bigint,
  "authentication_event_created_date" timestamp DEFAULT NOW(),
  "authentication_event_updated_date" timestamp
);

CREATE TABLE "authentication_event_type" (
  "authentication_event_type_id" BIGSERIAL PRIMARY KEY,
  "authentication_event_type_name" varchar(150),
  "authentication_event_type_description" text,
  "authentication_event_type_created_date" timestamp DEFAULT NOW(),
  "authentication_event_type_updated_date" timestamp
);

CREATE TABLE "batch_enrichment" (
  "batch_enrichement_id" BIGSERIAL PRIMARY KEY,
  "portfolio_id" bigint,
  "batch_enrichment_result_provenir" json,
  "batch_enrichment_result_mambu" json,
  "batch_enrichment_result_commercial_model" json,
  "batch_enrichment_result_ccds_model" json,
  "batch_enrichment_result_director_model" json,
  "batch_enrichment_created_date" timestamp DEFAULT NOW(),
  "batch_enrichment_updated_date" timestamp
);

CREATE TABLE "portal_comment" (
  "portal_comment_id" BIGSERIAL PRIMARY KEY,
  "product_quote_id" bigint,
  "portal_comment_type_id" bigint,
  "portal_comment_created_date" timestamp DEFAULT NOW(),
  "portal_comment_updated_date" timestamp
);

CREATE TABLE "portal_comment_type" (
  "portal_comment_type_id" BIGSERIAL PRIMARY KEY,
  "portal_comment_type_name" varchar(150),
  "portal_comment_type_description" text,
  "portal_comment_type_created_date" timestamp DEFAULT NOW(),
  "portal_comment_type_updated_date" timestamp
);

ALTER TABLE "party" ADD FOREIGN KEY ("party_role_id") REFERENCES "party_role" ("party_role_id");

ALTER TABLE "party" ADD FOREIGN KEY ("title_id") REFERENCES "title" ("title_id");

ALTER TABLE "party" ADD FOREIGN KEY ("gender_id") REFERENCES "gender" ("gender_id");

ALTER TABLE "party" ADD FOREIGN KEY ("party_living_arrangement_id") REFERENCES "living_arrangement" ("living_arrangement_id");

ALTER TABLE "party" ADD FOREIGN KEY ("citizenship_id") REFERENCES "citizenship" ("citizenship_id");

ALTER TABLE "party_relationship" ADD FOREIGN KEY ("party_relationship_type_id") REFERENCES "party_relationship_type" ("party_relationship_type_id");

ALTER TABLE "party_relationship" ADD FOREIGN KEY ("party_id") REFERENCES "party" ("party_id");

ALTER TABLE "party_relationship" ADD FOREIGN KEY ("related_party_id") REFERENCES "party" ("party_id");

ALTER TABLE "party_relationship" ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("organization_id");

ALTER TABLE "party_relationship" ADD FOREIGN KEY ("party_role_id") REFERENCES "party_role" ("party_role_id");

ALTER TABLE "party_contact_mechanism" ADD FOREIGN KEY ("party_contact_mechanism_type") REFERENCES "party_contact_mechanism_type" ("party_contact_mechanism_type_id");

ALTER TABLE "party_contact_mechanism" ADD FOREIGN KEY ("party_id") REFERENCES "party" ("party_id");

ALTER TABLE "party_contact_mechanism" ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("organization_id");

ALTER TABLE "communication_event" ADD FOREIGN KEY ("party_contact_id") REFERENCES "party_contact_mechanism" ("party_contact_id");

ALTER TABLE "communication_event" ADD FOREIGN KEY ("communication_event_type") REFERENCES "communication_event_type" ("communication_event_type_id");

ALTER TABLE "party_bank" ADD FOREIGN KEY ("bank_account_id") REFERENCES "bank_account" ("bank_account_id");

ALTER TABLE "party_bank" ADD FOREIGN KEY ("party_relationship_id") REFERENCES "party_relationship" ("party_relationship_id");

ALTER TABLE "party_agreements" ADD FOREIGN KEY ("party_id") REFERENCES "party" ("party_id");

ALTER TABLE "party_agreements" ADD FOREIGN KEY ("party_agreement_type_id") REFERENCES "party_agreement_type" ("party_agreement_type_id");

ALTER TABLE "document_storage" ADD FOREIGN KEY ("party_agreements_id") REFERENCES "party_agreements" ("party_agreements_id");

ALTER TABLE "product_category" ADD FOREIGN KEY ("product_category_parent") REFERENCES "product_category" ("product_category_id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_type_id") REFERENCES "product_type" ("product_type_id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_feature_id") REFERENCES "product_feature" ("product_feature_id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_category_id") REFERENCES "product_category" ("product_category_id");

ALTER TABLE "portfolio" ADD FOREIGN KEY ("organization_id") REFERENCES "organization" ("organization_id");

ALTER TABLE "portfolio" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("product_id");

ALTER TABLE "portfolio" ADD FOREIGN KEY ("product_quote_id") REFERENCES "product_quote" ("product_quote_id");

ALTER TABLE "product_quote" ADD FOREIGN KEY ("product_quote_status_id") REFERENCES "product_quote_status" ("product_quote_status_id");

ALTER TABLE "authentication_event" ADD FOREIGN KEY ("product_quote_id") REFERENCES "product_quote" ("product_quote_id");

ALTER TABLE "authentication_event" ADD FOREIGN KEY ("product_quote_status_id") REFERENCES "product_quote_status" ("product_quote_status_id");

ALTER TABLE "authentication_event" ADD FOREIGN KEY ("authentication_event_type") REFERENCES "authentication_event_type" ("authentication_event_type_id");

ALTER TABLE "batch_enrichment" ADD FOREIGN KEY ("portfolio_id") REFERENCES "portfolio" ("portfolio_id");

ALTER TABLE "portal_comment" ADD FOREIGN KEY ("product_quote_id") REFERENCES "product_quote" ("product_quote_id");

ALTER TABLE "portal_comment" ADD FOREIGN KEY ("portal_comment_type_id") REFERENCES "portal_comment_type" ("portal_comment_type_id");

COMMENT ON TABLE "party" IS 'A party Is a system user 
    independently of the role
    ';

COMMENT ON TABLE "party_relationship" IS 'A party role could be: Applicant, Broker, Company, Employee
      Uderwriter, Operation, Director,  Funder ';

COMMENT ON TABLE "party_contact_mechanism" IS 'A party contact mechanism, could also be attributed to an organization
     is the contact method defined by the TYPE, such as home number, work email, 
     business address etc.
     ';

COMMENT ON TABLE "party_role" IS 'A party role could be: Applicant, Broker, Company, Employee
      Uderwriter, Operation, Director,  Funder ';

COMMIT;