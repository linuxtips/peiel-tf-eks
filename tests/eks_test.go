package test

import (
	"fmt"
	"testing"

	// "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestEKSCluster(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		Vars: map[string]interface{}{
			"vpc_cidr": "192.168.10.0/23",
			"subnets": []string {
				"192.168.10.0/24",
				"192.168.11.0/24",
			},
			"aws_iam_access_key": "",
			"aws_iam_secret_key": "",
			"app": "test",
			"region": "us-west-2",
			"env": "prod",
			"aws_account": []string {
				"296686755935",
			},
			"ng_min_size": 1,
			"ng_max_size": 3,
			"ng_desired_size": 3,
		}, 
		BackendConfig: map[string]interface{}{
			"bucket": "peiel--tf-backend-tests",
			"key":    "eks",
			"region": "us-west-2",
		},
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	clusterName := terraform.Output(t, terraformOptions, "eks_cluster_name")

	// Verify that the EKS cluster exists
	clusterNameCheck := fmt.Sprintf("k8s_%s_%s_%s_001_","my-app","us-west-2","prod")
	assert.Equal(t, clusterName, clusterNameCheck, "O cluster tem o mesmo nome")

}

