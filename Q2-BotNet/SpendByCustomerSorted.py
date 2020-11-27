# To run on 5 EMR nodes:
#!python SpendByCustomerSorted.py -r emr --num-ec2-instances 5 --items=customer-orders.csv

from mrjob.job import MRJob
from mrjob.step import MRStep

class SpendByCustomerSorted(MRJob):
    
    def configure_options(self):
       super(SpendByCustomerSorted,self).configure_options()
       self.add_file_option('--items', help='Path to customer data')

    def steps(self):
        return [
            MRStep(mapper=self.mapper_get_orders,
                   reducer=self.reducer_totals_by_customer),
            MRStep(mapper=self.mapper_make_amounts_key,
                   reducer=self.reducer_output_results)
        ]
    def mapper_get_orders(self, _, line):
        (customerID, itemID, orderAmount) = line.split(',')
        yield customerID, float(orderAmount)

    def reducer_totals_by_customer(self, customerID, orders):
        yield customerID, sum(orders)

    def mapper_make_amounts_key(self, customerID, orderTotal):
        yield '%04.02f'%float(orderTotal), customerID
        
    def reducer_output_results(self, orderTotal, customerIDs):
        for customerID in customerIDs:
            yield customerID, orderTotal

if __name__ == '__main__':
    SpendByCustomerSorted.run()
    