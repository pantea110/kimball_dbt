---------- values_at_least SCREEN
---- Verifies that each row in a column is greater than or equal a provided value, if not null.

{%- macro null_screen(screen_args, kwargs) -%}
---- Pass the screen_args object with these params:
---- screen_args:
----    - blacklisted_values (list) the values to deny
----    - value_type (string) the datatype for the list of values

    {{kwargs.database}}_{{kwargs.schema}}_{{kwargs.entity}}_{{screen_args.column}}_VALUES_AT_LEAST_{{screen_args.provided_value}} AS (
        SELECT
            {{universal_audit_property_set('values_at_least_',screen_args,kwargs)}}

        AND
            (
                    {{screen_args.column}} >= {{screen_args.provided_value}}
                OR
                    {{screen_args.column}} IS NULL
            )
    )
{%- endmacro -%}