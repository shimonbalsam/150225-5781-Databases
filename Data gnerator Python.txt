import csv
import datetime
import random
import names


def random_with_N_digits(n):
    range_start = 10 ** (n - 1)
    range_end = (10 ** n) - 1
    return random.randint(range_start, range_end)


start_date = datetime.date(1990, 1, 1)
end_date = datetime.date(2010, 12, 30)
time_between_dates = end_date - start_date
days_between_dates = time_between_dates.days


ranks = ['Aluf', 'Tat aluf', 'Aluf mishne', 'Sgan aluf', 'Rav seren'
    , 'Seren', 'Rav samal rishon', 'Rav samal', 'Samal', 'Rav turai', 'Turai'
    , 'Seren', 'Rav samal rishon', 'Rav samal', 'Samal', 'Rav turai', 'Turai'
    , 'Seren', 'Rav samal rishon', 'Rav samal', 'Samal', 'Rav turai', 'Turai'
    , 'Seren', 'Rav samal rishon', 'Rav samal', 'Samal', 'Rav turai', 'Turai']




def csv_writer_soldier(rows_num):
    List = []
    with open('soldier.csv', mode='w') as csv_file:
        fieldnames = ['Run key soldier', 'Id', 'Name', 'Rank', 'Salary',
                      'Weapon id', 'Regular Or permanent', 'Recruitment date', 'Release date']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()

        start_date = datetime.date(1990, 1, 1)
        end_date = datetime.date(2018, 12, 30)
        time_between_dates = end_date - start_date
        days_between_dates = time_between_dates.days

        for i in range(rows_num):
            id = random.randint(1000000, 299999999)
            name = names.get_full_name()
            salary = random.randint(1500, 10000)
            weapon_id = random.randint(10000, 99999)
            rank = random.choice(ranks)


            random_number_of_days = random.randrange(days_between_dates)
            recruitment_date = start_date + datetime.timedelta(days=random_number_of_days)
            release_date = recruitment_date + datetime.timedelta(days=1000)

            regular_Or_permanent = random.choice(['Regular', 'permanent'])

            writer.writerow({'Run key soldier': i, 'Id': id, 'Name': name, 'Rank': rank, 'Salary': salary,
                             'Weapon id': weapon_id, 'Regular Or permanent': regular_Or_permanent
                                , 'Recruitment date': recruitment_date, 'Release date': release_date})


def csv_writer_reserves(rows_num):
    with open('reserves.csv', mode='w') as csv_file:
        fieldnames = ['Run key reserves','Run key soldiers',  'Salary per day',
                      'Reserve contact', 'Days served', 'Last recruited Date', 'Reserve training']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()

        Reserve_training_list = ['grandes', 'sniper', 'explosives', 'heavy machine-gun',
                                 'scout', 'communication', 'driver', 'anti-air', 'commander', 'medic']

        j=0
        for i in range(0,rows_num,6):
            salary_per_day = random.randint(200, 800)
            days_served = random.randint(1, 1000)
            contact_phone = '050-' + str(random_with_N_digits(7))
            random_number_of_days = random.randrange(300, 3000)
            date_last_recruited = end_date+ datetime.timedelta(days=random_number_of_days)
            reserve_training = random.choice(Reserve_training_list)

            writer.writerow(
                {'Run key reserves':j,'Run key soldiers':i, 'Salary per day': salary_per_day,
                 'Reserve contact': contact_phone, 'Days served': days_served
                    , 'Last recruited Date': date_last_recruited, 'Reserve training': reserve_training})
            j+=1

def csv_writer_adviser(rows_num):
    with open('adviser.csv', mode='w') as csv_file:
        fieldnames = ['Run key adviser', 'Id', 'Name', 'Certification', 'Salary',
                      'Force', 'Specialty']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()

        certification_list = ['Physics', 'Chemistry', 'geology ', 'Automotive Enginee', 'Astronomy', 'Biochemistry',
                              'Microbiology', 'Botany', 'Zoology', 'Chemical Engineer', 'Computer Engineer']
        force_list = ['Infantry', 'Air', 'Navy', 'Armored', 'Intelligence']
        specialty_list = ['Gaza', 'Lebanon', 'Egypt', 'Syria', 'Explosives', 'Enemy-psychology', 'Finance',
                          'Animal training', 'Firearms', 'Health-care']

        for i in range(rows_num):
            id = random.randint(6000000, 999999999)
            name = names.get_full_name()
            salary = random.randint(3000, 30000)
            certification = random.choice(certification_list)

            force = random.choice(force_list)
            specialty = random.choice(specialty_list)
            writer.writerow(
                {'Run key adviser': i, 'Id': id, 'Name': name, 'Salary': salary,
                 'Certification': certification, 'Force': force
                    , 'Specialty': specialty})


if __name__ == '__main__':
    rows_nums = 20000
    csv_writer_soldier(rows_nums)
    csv_writer_reserves(rows_nums)
     #csv_writer_adviser(rows_nums)
