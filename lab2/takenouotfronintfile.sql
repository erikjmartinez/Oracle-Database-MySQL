COLUMN table_name_base     FORMAT A30 HEADING "Base Tables"
COLUMN sequence_name_base  FORMAT A30 HEADING "Base Sequences"
SELECT   a.table_name_base
,        b.sequence_name_base
FROM    (SELECT   table_name AS table_name_base
         FROM     user_tables
         WHERE    table_name IN ('SYSTEM_USER_LAB'
                                ,'COMMON_LOOKUP_LAB'
                                ,'MEMBER_LAB'
                                ,'CONTACT_LAB'
                                ,'ADDRESS_LAB'
                                ,'STREET_ADDRESS_LAB'
                                ,'TELEPHONE_LAB'
                                ,'ITEM_LAB'
                                ,'RENTAL_LAB'
                                ,'RENTAL_ITEM_LAB')) a  INNER JOIN
        (SELECT   sequence_name AS sequence_name_base
         FROM     user_sequences
         WHERE    sequence_name IN ('SYSTEM_USER_LAB_S1'
                                   ,'COMMON_LOOKUP_LAB_S1'
                                   ,'MEMBER_LAB_S1'
                                   ,'CONTACT_LAB_S1'
                                   ,'ADDRESS_LAB_S1'
                                   ,'STREET_ADDRESS_LAB_S1'
                                   ,'TELEPHONE_LAB_S1'
                                   ,'ITEM_LAB_S1'
                                   ,'RENTAL_LAB_S1'
                                   ,'RENTAL_ITEM_LAB_S1')) b
ON       a.table_name_base =
           SUBSTR( b.sequence_name_base, 1, REGEXP_INSTR(b.sequence_name_base,'_S1') - 1)
ORDER BY CASE
           WHEN table_name_base LIKE 'SYSTEM_USER%' THEN 0
           WHEN table_name_base LIKE 'COMMON_LOOKUP%' THEN 1
           WHEN table_name_base LIKE 'MEMBER%' THEN 2
           WHEN table_name_base LIKE 'CONTACT%' THEN 3
           WHEN table_name_base LIKE 'ADDRESS%' THEN 4
           WHEN table_name_base LIKE 'STREET_ADDRESS%' THEN 5
           WHEN table_name_base LIKE 'TELEPHONE%' THEN 6
           WHEN table_name_base LIKE 'ITEM%' THEN 7
           WHEN table_name_base LIKE 'RENTAL%' AND NOT table_name_base LIKE 'RENTAL_ITEM%' THEN 8
           WHEN table_name_base LIKE 'RENTAL_ITEM%' THEN 9
         END;
