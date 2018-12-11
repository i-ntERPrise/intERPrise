-------------------------------------------------
CREATE TABLE AOU010F (
       CATCDE CHAR(10)      NOT NULL,
       GRPCDE CHAR(10)      NOT NULL,
       SERIAL INTEGER       NOT NULL,
       RECSTS CHAR(2)       NOT NULL,
       OBJNME CHAR(10)      NOT NULL,
       SUFFIX CHAR(3)       NOT NULL,
       STOPPR CHAR(1)       NOT NULL DEFAULT '1',
       CMDFLD CHAR(1024)    NOT NULL,
       CONSTRAINT AOU010F_P PRIMARY KEY(CATCDE,GRPCDE,SERIAL,RECSTS))
       RCDFMT AOU010FR;
-------------------------------------------------
LABEL ON TABLE AOU010F IS 'AO Command Repository';
-------------------------------------------------
LABEL ON COLUMN AOU010F (
         CATCDE IS 'Category            Code'  ,
         GRPCDE IS 'Group               Code'  ,
         SERIAL IS 'Serial              No.'   ,
         RECSTS IS 'R/S                 '      ,
         OBJNME IS 'Object              Name'  ,
         SUFFIX IS 'Suffix              '      ,
         STOPPR IS 'Stop                Proc.' ,
         CMDFLD IS 'Command String      '      );
-------------------------------------------------
LABEL ON COLUMN AOU010F (
         CATCDE TEXT IS 'Category Code'   ,
         GRPCDE TEXT IS 'Group Code'      ,
         SERIAL TEXT IS 'Serial No.'      ,
         RECSTS TEXT IS 'Record Status'   ,
         OBJNME TEXT IS 'Object Name'     ,
         SUFFIX TEXT IS 'Suffix'          ,
         STOPPR TEXT IS 'Stop Proc.       ' ,
         CMDFLD TEXT IS 'Command String'  );
-------------------------------------------------
