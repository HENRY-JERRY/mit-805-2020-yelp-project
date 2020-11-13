from abc import ABC

from mrjob.job import MRJob


class BusinessCategories(MRJob, ABC):

    def mapper(self, _, line):
        row = line.split(',')
        category = row[13]
        yield category, 1

    def reducer(self, cat, count):
        yield cat, sum(count)


if __name__ == '__main__':
    BusinessCategories.run()