pipeline {
  agent any 
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
    string defaultValue: '2', description: '', name: 'COUNT', trim: false
  }
  environment {
   
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
    COUNT = "${params.COUNT}"
    
  }
  stages {
    stage('Create Instance') {
      steps {
        sh 'aws ec2 run-instances --image-id ami-005c06c6de69aee84 --count "$COUNT" --instance-type t2.micro --region us-west-1'
      }
    
    }
    
  }
}

