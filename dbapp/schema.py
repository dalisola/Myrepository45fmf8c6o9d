# coding: utf-8
from sqlalchemy import BigInteger, Boolean, Column, Date, DateTime, ForeignKey, Integer, JSON, String, Text, text
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class AuthenticationEventType(Base):
    __tablename__ = 'authentication_event_type'

    authentication_event_type_id = Column(BigInteger, primary_key=True)
    authentication_event_type_name = Column(String(150))
    authentication_event_type_description = Column(Text)
    authentication_event_type_created_date = Column(DateTime)
    authentication_event_type_updated_date = Column(DateTime)


class BankAccount(Base):
    __tablename__ = 'bank_account'

    bank_account_id = Column(BigInteger, primary_key=True)
    bank_account_bank = Column(String)
    bank_account_sortcode = Column(Integer)
    bank_account_account_number = Column(String)
    bank_account_address = Column(Text)
    bank_account_city = Column(String)
    bank_account_created_date = Column(DateTime)
    bank_account_updated_date = Column(DateTime)


class Citizenship(Base):
    __tablename__ = 'citizenship'

    citizenship_id = Column(BigInteger, primary_key=True)
    citizenship_name = Column(String(150))
    citizenship_description = Column(Text)
    citizenship_created_date = Column(DateTime)
    citizenship_updated_date = Column(DateTime)


class CommunicationEventType(Base):
    __tablename__ = 'communication_event_type'

    communication_event_type_id = Column(BigInteger, primary_key=True)
    communication_event_type_name = Column(String(150))
    communication_event_type_description = Column(Text)
    communication_event_type_created_date = Column(DateTime)
    communication_event_type_updated_date = Column(DateTime)


class Gender(Base):
    __tablename__ = 'gender'

    gender_id = Column(BigInteger, primary_key=True)
    gender_name = Column(String(150))
    gender_description = Column(Text)
    gender_created_date = Column(DateTime)
    gender_updated_date = Column(DateTime)


class LivingArrangement(Base):
    __tablename__ = 'living_arrangement'

    living_arrangement_id = Column(BigInteger, primary_key=True)
    living_arrangement_name = Column(String(150))
    living_arrangement_description = Column(Text)
    living_arrangement_created_date = Column(DateTime)
    living_arrangement_updated_date = Column(DateTime)


class Organization(Base):
    __tablename__ = 'organization'

    organization_id = Column(BigInteger, primary_key=True)
    organization_name = Column(String(150))
    organization_description = Column(Text)
    organization_number = Column(String)
    organization_classification_id = Column(BigInteger)
    organization_created_date = Column(DateTime)
    organization_updated_date = Column(DateTime)


class PartyAgreementType(Base):
    __tablename__ = 'party_agreement_type'

    party_agreement_type_id = Column(BigInteger, primary_key=True)
    party_agreement_type_name = Column(String(150))
    party_agreement_type_description = Column(Text)
    party_agreement_required = Column(Boolean)
    party_agreement_type_created_date = Column(DateTime)
    party_agreement_type_updated_date = Column(DateTime)


class PartyContactMechanismType(Base):
    __tablename__ = 'party_contact_mechanism_type'

    party_contact_mechanism_type_id = Column(BigInteger, primary_key=True)
    party_contact_mechanism_type_name = Column(String(150))
    party_contact_mechanism_type_description = Column(Text)
    party_contact_mechanism_type_created_date = Column(DateTime)
    party_contact_mechanism_type_updated_date = Column(DateTime)


class PartyRelationshipType(Base):
    __tablename__ = 'party_relationship_type'

    party_relationship_type_id = Column(BigInteger, primary_key=True)
    party_relationship_type_name = Column(String(150))
    party_relationship_type_description = Column(Text)
    party_relationship_type_created_date = Column(DateTime)
    party_relationship_type_updated_date = Column(DateTime)


class PartyRole(Base):
    __tablename__ = 'party_role'

    party_role_id = Column(BigInteger, primary_key=True)
    party_role_name = Column(String(150))
    party_role_description = Column(Text)
    party_role_created_date = Column(DateTime)
    party_role_updated_date = Column(DateTime)


class PortalCommentType(Base):
    __tablename__ = 'portal_comment_type'

    portal_comment_type_id = Column(BigInteger, primary_key=True)
    portal_comment_type_name = Column(String(150))
    portal_comment_type_description = Column(Text)
    portal_comment_type_created_date = Column(DateTime)
    portal_comment_type_updated_date = Column(DateTime)


class ProductCategory(Base):
    __tablename__ = 'product_category'

    product_category_id = Column(BigInteger, primary_key=True)
    product_category_parent = Column(ForeignKey('product_category.product_category_id'))
    product_category_name = Column(String(150))
    product_category_description = Column(Text)
    product_category_notes = Column(Text)
    product_category_created_date = Column(DateTime)
    product_category_updated_date = Column(DateTime)

    parent = relationship('ProductCategory', remote_side=[product_category_id])


class ProductFeature(Base):
    __tablename__ = 'product_feature'

    product_feature_id = Column(BigInteger, primary_key=True)
    product_feature_name = Column(String(150))
    product_feature_description = Column(Text)
    product_feature_created_date = Column(DateTime)
    product_feature_updated_date = Column(DateTime)


class ProductQuoteStatu(Base):
    __tablename__ = 'product_quote_status'

    product_quote_status_id = Column(BigInteger, primary_key=True)
    product_quote_status_name = Column(String(150))
    product_quote_status_description = Column(Text)
    product_quote_status_created_date = Column(DateTime)
    product_quote_status_updated_date = Column(DateTime)


class ProductType(Base):
    __tablename__ = 'product_type'

    product_type_id = Column(BigInteger, primary_key=True)
    product_type_name = Column(String(150))
    product_type_description = Column(Text)
    product_type_created_date = Column(DateTime)
    product_type_updated_date = Column(DateTime)


class Title(Base):
    __tablename__ = 'title'

    title_id = Column(BigInteger, primary_key=True)
    title_name = Column(String(150))
    title_description = Column(Text)
    title_created_date = Column(DateTime)
    title_updated_date = Column(DateTime)


class Party(Base):
    __tablename__ = 'party'

    party_id = Column(BigInteger, primary_key=True)
    party_role_id = Column(ForeignKey('party_role.party_role_id'))
    title_id = Column(ForeignKey('title.title_id'))
    gender_id = Column(ForeignKey('gender.gender_id'))
    party_living_arrangement_id = Column(ForeignKey('living_arrangement.living_arrangement_id'))
    citizenship_id = Column(ForeignKey('citizenship.citizenship_id'))
    party_uuid = Column(String)
    party_first_name = Column(String(150))
    party_middle_name = Column(String(150))
    party_last_name = Column(String(150))
    party_nickname = Column(String)
    party_suffix = Column(String)
    party_date_of_birth = Column(Date)
    party_email = Column(String)
    party_notes = Column(Text)
    party_is_archived = Column(Boolean)
    party_created_date = Column(DateTime)
    party_updated_date = Column(DateTime)

    citizenship = relationship('Citizenship')
    gender = relationship('Gender')
    party_living_arrangement = relationship('LivingArrangement')
    party_role = relationship('PartyRole')
    title = relationship('Title')


class Product(Base):
    __tablename__ = 'product'

    product_id = Column(BigInteger, primary_key=True)
    product_type_id = Column(ForeignKey('product_type.product_type_id'))
    product_feature_id = Column(ForeignKey('product_feature.product_feature_id'))
    product_category_id = Column(ForeignKey('product_category.product_category_id'))
    product_name = Column(String(150))
    product_description = Column(Text)
    product_introduction_date = Column(Date)
    product_discontinued_date = Column(Date)
    product_support_discontinued_date = Column(Date)
    product_created_date = Column(DateTime)
    product_updated_date = Column(DateTime)

    product_category = relationship('ProductCategory')
    product_feature = relationship('ProductFeature')
    product_type = relationship('ProductType')


class ProductQuote(Base):
    __tablename__ = 'product_quote'

    product_quote_id = Column(BigInteger, primary_key=True)
    product_quote_status_id = Column(ForeignKey('product_quote_status.product_quote_status_id'))
    product_quote_provenir_data = Column(JSON)
    product_quote_psychometric_data = Column(JSON)
    product_quote_created_date = Column(DateTime)
    product_quote_updated_date = Column(DateTime)

    product_quote_status = relationship('ProductQuoteStatu')


class AuthenticationEvent(Base):
    __tablename__ = 'authentication_event'

    authentication_event_id = Column(BigInteger, primary_key=True)
    product_quote_id = Column(ForeignKey('product_quote.product_quote_id'))
    product_quote_status_id = Column(ForeignKey('product_quote_status.product_quote_status_id'))
    authentication_event_type = Column(ForeignKey('authentication_event_type.authentication_event_type_id'))
    authentication_event_created_date = Column(DateTime)
    authentication_event_updated_date = Column(DateTime)

    authentication_event_type1 = relationship('AuthenticationEventType')
    product_quote = relationship('ProductQuote')
    product_quote_status = relationship('ProductQuoteStatu')


class PartyAgreement(Base):
    __tablename__ = 'party_agreements'

    party_agreements_id = Column(BigInteger, primary_key=True)
    party_id = Column(ForeignKey('party.party_id'))
    party_agreement_type_id = Column(ForeignKey('party_agreement_type.party_agreement_type_id'))
    party_agreements_agreed = Column(Boolean)
    party_agreements_created_date = Column(DateTime)
    party_agreements_updated_date = Column(DateTime)

    party_agreement_type = relationship('PartyAgreementType')
    party = relationship('Party')


class PartyContactMechanism(Base):
    __tablename__ = 'party_contact_mechanism'

    party_contact_id = Column(BigInteger, primary_key=True)
    party_contact_mechanism_type = Column(ForeignKey('party_contact_mechanism_type.party_contact_mechanism_type_id'))
    party_id = Column(ForeignKey('party.party_id'))
    organization_id = Column(ForeignKey('organization.organization_id'))
    party_contact_mechanism_email_address = Column(String)
    party_contact_mechanism_address_line_1 = Column(String)
    party_contact_mechanism_address_line_2 = Column(String)
    party_contact_mechanism_address_line_3 = Column(String)
    party_contact_mechanism_city = Column(String)
    party_contact_mechanism_country = Column(String)
    party_contact_mechanism_postcode = Column(String)
    party_contact_mechanism_country_id = Column(String)
    party_contact_mechanism_mobile_number = Column(String)
    party_contact_mechanism_telephone_number = Column(String)
    party_contact_mechanism_created_date = Column(DateTime)
    party_contact_mechanism_updated_date = Column(DateTime)

    organization = relationship('Organization')
    party_contact_mechanism_type1 = relationship('PartyContactMechanismType')
    party = relationship('Party')


class PartyRelationship(Base):
    __tablename__ = 'party_relationship'

    party_relationship_id = Column(BigInteger, primary_key=True)
    party_relationship_type_id = Column(ForeignKey('party_relationship_type.party_relationship_type_id'))
    party_id = Column(ForeignKey('party.party_id'))
    related_party_id = Column(ForeignKey('party.party_id'))
    organization_id = Column(ForeignKey('organization.organization_id'))
    party_role_id = Column(ForeignKey('party_role.party_role_id'))
    party_relationship_name = Column(String(150))
    party_relationship_description = Column(Text)
    party_relationship_created_date = Column(DateTime)
    party_relationship_updated_date = Column(DateTime)

    organization = relationship('Organization')
    party = relationship('Party', primaryjoin='PartyRelationship.party_id == Party.party_id')
    party_relationship_type = relationship('PartyRelationshipType')
    party_role = relationship('PartyRole')
    related_party = relationship('Party', primaryjoin='PartyRelationship.related_party_id == Party.party_id')


class PortalComment(Base):
    __tablename__ = 'portal_comment'

    portal_comment_id = Column(BigInteger, primary_key=True)
    product_quote_id = Column(ForeignKey('product_quote.product_quote_id'))
    portal_comment_type_id = Column(ForeignKey('portal_comment_type.portal_comment_type_id'))
    portal_comment_created_date = Column(DateTime)
    portal_comment_updated_date = Column(DateTime)

    portal_comment_type = relationship('PortalCommentType')
    product_quote = relationship('ProductQuote')


class Portfolio(Base):
    __tablename__ = 'portfolio'

    portfolio_id = Column(BigInteger, primary_key=True)
    organization_id = Column(ForeignKey('organization.organization_id'))
    product_id = Column(ForeignKey('product.product_id'))
    product_quote_id = Column(ForeignKey('product_quote.product_quote_id'))
    portfolio_assessment_comments = Column(String)
    portfolio_decision_comments = Column(String)
    portfolio_created_date = Column(DateTime)
    portfolio_updated_date = Column(DateTime)

    organization = relationship('Organization')
    product = relationship('Product')
    product_quote = relationship('ProductQuote')


class BatchEnrichment(Base):
    __tablename__ = 'batch_enrichment'

    batch_enrichement_id = Column(BigInteger, primary_key=True)
    portfolio_id = Column(ForeignKey('portfolio.portfolio_id'))
    batch_enrichment_result_provenir = Column(JSON)
    batch_enrichment_result_mambu = Column(JSON)
    batch_enrichment_result_commercial_model = Column(JSON)
    batch_enrichment_result_ccds_model = Column(JSON)
    batch_enrichment_result_director_model = Column(JSON)
    batch_enrichment_created_date = Column(DateTime)
    batch_enrichment_updated_date = Column(DateTime)

    portfolio = relationship('Portfolio')


class CommunicationEvent(Base):
    __tablename__ = 'communication_event'

    communication_event_id = Column(BigInteger, primary_key=True)
    party_contact_id = Column(ForeignKey('party_contact_mechanism.party_contact_id'))
    communication_event_type = Column(ForeignKey('communication_event_type.communication_event_type_id'))
    communication_event_created_date = Column(DateTime)
    communication_event_updated_date = Column(DateTime)

    communication_event_type1 = relationship('CommunicationEventType')
    party_contact = relationship('PartyContactMechanism')


class DocumentStorage(Base):
    __tablename__ = 'document_storage'

    document_storage_id = Column(BigInteger, primary_key=True)
    party_agreements_id = Column(ForeignKey('party_agreements.party_agreements_id'))
    document_storage_config = Column(JSON)
    document_storage_created_date = Column(DateTime)
    document_storage_updated_date = Column(DateTime)

    party_agreements = relationship('PartyAgreement')


class PartyBank(Base):
    __tablename__ = 'party_bank'

    party_bank_id = Column(BigInteger, primary_key=True)
    bank_account_id = Column(ForeignKey('bank_account.bank_account_id'))
    party_relationship_id = Column(ForeignKey('party_relationship.party_relationship_id'))
    party_bank_created_date = Column(DateTime)
    party_bank_updated_date = Column(DateTime)

    bank_account = relationship('BankAccount')
    party_relationship = relationship('PartyRelationship')
