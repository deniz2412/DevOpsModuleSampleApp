# Sample app from the Java module used for DevOps


## Questions for mentor:
- advantage of using SCM in stage vs as a pre stage action (outside of jenkinsfile)
- Solving failfast edge case parallel
- Notification sending in jenkinsfile vs pre stage config
- Github Actions vs Webhook
- Durability settings


## General idea for last assignment:
2 core branches (dev and main) they go through the full pipeline, a PR for a dev branch coming from feature branch will get approved and the dev branch is put into the pipeline. If its a hotfix then it gets put into main and dev when we want to merge dev into main jenkins creates a seperate branch called release where it gets tested and then merged into main. Core branches will go through build test and deliver (docker image and push to repository). Second pipeline pulls image from repo and deploys it to the docker swarm. (Install of jenkins needed on the swarm aswell maybe)

## Questions for last assignment:
- Multibranch pipeline or a normal one.
- How could we make so that a hotfix gets priority if it pops up
- Could we send a webhook to the jenkins on the swarm to launch his deploy pipeline 
- Can we use a freestyle project for runner?
