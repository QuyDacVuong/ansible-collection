login=db2cdl
password={{ lookup('amazon.aws.ssm_parameter', '/{{ env }}/common/db2cdl') }}
