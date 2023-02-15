provider "aws" {
 region= "ap-south-1"
}

module "appmodule"
source= "./terra3modules/modules/appmodule"

module "dbmodule"
source= "./terra3modules/modules/dbmodule"

module "webmodule"
source= "./terra3modules/modules/webmodule"

module "vpcmodule"
source= "./terra3modules/modules/vpcmodule"
