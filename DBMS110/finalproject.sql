 -- float errors had to use number in place

create table buyer (
    account_number      int         not null, -- PK
    first_name          char(255)   null,
    last_name           char(255)   null,
    email               char(255)   null,
    phone_number        char(10)    null,
    occupation          char(255)   null,
    salary              number      null,
    credit_score        int         null,
    street_address      char(255)   null,
    city                char(255)   null,
    state               char(2)     null,
    zip_code            char(5)     null,
    constraint buyer_pk
        primary key (account_number)
);

create table employee (
    employee_id         int         not null, -- PK
    first_name          char(255)   null,
    last_name           char(255)   null,
    email               char(255)   null,
    phone_number        char(10)    null,
    job_title           char(255)   null,
    salary              number      null,
    hire_date           date        null,
    street_address      char(255)   null,
    city                char(255)   null,
    state               char(2)     null,
    zip_code            char(5)     null,
    constraint employee_pk
        primary key (employee_id)
);

create table contractor (
    contractor_id       int         not null, -- PK
    name                char(255)   null,
    email               char(255)   null,
    phone_number        char(10)    null,
    street_address      char(255)   null,
    city                char(255)   null,
    state               char(2)     null,
    zip_code            char(5)     null,
    constraint contractor_pk
        primary key (contractor_id)
);

create table sales_agent (
    agent_id            int         not null, -- PK
    first_name          char(255)   null,
    last_name           char(255)   null,
    email               char(255)   null,
    phone_number        char(10)    null,
    street_address      char(255)   null,
    city                char(255)   null,
    state               char(2)     null,
    zip_code            char(5)     null,
    constraint sales_agent_pk
        primary key (agent_id)
);

create table agreement (
    agreement_id        int         not null, -- PK
    contractor_id       int         not null, -- PK FK
    description         char(255)   not null,
    FOREIGN KEY         (contractor_id) REFERENCES contractor (contractor_id) ON DELETE CASCADE,
    constraint agreement_pk
        primary key (agreement_id, contractor_id)
);

create table architecture (
    style_id            int         not null, -- PK
    style_title         char(255)   null,
    description         char(255)   null,
    constraint architecture_pk
        primary key (style_id)
);

create table property (
    parcel_number       int         not null, -- PK
    agent_id            int         not null, -- FK
    room_count          int         null,
    square_feet         number      null,
    purchase_date       date        null,
    purchase_amount     number      null,
    market_value        number      null,
    style_id            int         null, -- FK
    street_address      char(255)   null,
    city                char(255)   null,
    state               char(2)     null,
    zip_code            char(5)     null,
    FOREIGN KEY         (agent_id) REFERENCES sales_agent (agent_id) ON DELETE CASCADE,
    FOREIGN KEY         (style_id) REFERENCES architecture (style_id) ON DELETE CASCADE,
    constraint property_pk
        primary key (parcel_number)
);

create table property_buyer (
    account_number      int         not null, -- PK FK
    parcel_number       int         not null, -- PK FK
    FOREIGN KEY         (account_number) REFERENCES buyer (account_number) ON DELETE CASCADE,
    FOREIGN KEY         (parcel_number) REFERENCES property (parcel_number) ON DELETE CASCADE,
    constraint property_buyer
        primary key (account_number, parcel_number)
);