login=db2pyr
password={{ lookup('amazon.aws.ssm_parameter', '/{{ env }}/common/db2pyr') }}
