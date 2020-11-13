from abc import ABC

from mrjob.job import MRJob


class BusinessAttributes(MRJob, ABC):

    def mapper(self, _, line):
        row = line.split(',')
        attribute = row[12]
        yield attribute, 1

    def reducer(self, cat, count):
        yield cat, sum(count)


if __name__ == '__main__':
    BusinessAttributes.run()