login=db2read
password={{ lookup('amazon.aws.ssm_parameter', '/{{ env }}/common/db2read') }}
