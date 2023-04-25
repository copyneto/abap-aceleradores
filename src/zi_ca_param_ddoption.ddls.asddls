@AbapCatalog.sqlViewName: 'ZVCA_PARAM_OPT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View Basic Parâmetro - Option'
@ObjectModel.resultSet.sizeCategory: #XS
define view ZI_CA_PARAM_DDOPTION
  as select from dd07l as Domain
  association to dd07t as _Text on $projection.Domname  = _Text.domname
                               and $projection.As4local = _Text.as4local
                               and $projection.Valpos   = _Text.valpos
                               and $projection.As4vers  = _Text.as4vers
                               and _Text.ddlanguage = $session.system_language
{

      @UI.hidden: true
  key domname    as Domname,
      @UI.hidden: true
  key as4local   as As4local,
      @UI.hidden: true
  key valpos     as Valpos,
      @UI.hidden: true
  key as4vers    as As4vers,
  
      @ObjectModel.text.element: ['Text']
      domvalue_l as DomvalueL,
      
      _Text.ddtext as Text,
      
      @UI.hidden: true
      domvalue_h as DomvalueH,
      @UI.hidden: true
      appval     as Appval

}
where
      Domain.domname  = 'DDOPTION'
  and Domain.as4local = 'A';
