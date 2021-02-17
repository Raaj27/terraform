pipeline {
  agent any 
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    string defaultValue: '0', description: '', name: 'instancecount', trim: false
  }
  environment {
   
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    
    TF_IN_AUTOMATION = '1'
    
  }
  stages {
    stage('Create Instance') {
      steps {
        sh "terraform init -input=false" 
        sh "terraform plan -input=false -var instancecount=\"${params.instancecount}\""
        sh  "terraform apply -input=false --auto-approve"
      }
    
    }
    
  }
}
