--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 13.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	django_celery_beat	crontabschedule
8	django_celery_beat	intervalschedule
9	django_celery_beat	periodictask
10	django_celery_beat	periodictasks
11	django_celery_beat	solarschedule
12	django_celery_beat	clockedschedule
13	oauth2_provider	application
14	oauth2_provider	accesstoken
15	oauth2_provider	grant
16	oauth2_provider	refreshtoken
17	social_django	association
18	social_django	code
19	social_django	nonce
20	social_django	usersocialauth
21	social_django	partial
22	exchange	exchangebackend
23	exchange	rate
24	users	user
25	users	billingaddress
26	users	shippingaddress
27	users	profile
28	users	passwordreset
29	users	emailconfirmation
30	products	brand
31	products	filterproperties
32	products	middlepricerange
33	products	pricefiltercategory
34	products	product
35	products	filtercategory
36	products	category
37	products	answer
38	products	commentonreview
39	products	filtervalues
40	products	report
41	products	productreview
42	products	faq
43	products	abstractproduct
45	shopit	brand
46	shopit	category
47	shopit	commentonreview
49	shopit	filtercategory
50	shopit	filtervalues
51	shopit	middlepricerange
52	shopit	pricefiltercategory
53	shopit	subcategory
54	shopit	report
55	shopit	productreview
56	shopit	productinfo
57	shopit	product
58	shopit	filterproperties
59	users	seller
48	shopit	productfaq
44	shopit	productfaqanswer
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add crontab	7	add_crontabschedule
26	Can change crontab	7	change_crontabschedule
27	Can delete crontab	7	delete_crontabschedule
28	Can view crontab	7	view_crontabschedule
29	Can add interval	8	add_intervalschedule
30	Can change interval	8	change_intervalschedule
31	Can delete interval	8	delete_intervalschedule
32	Can view interval	8	view_intervalschedule
33	Can add periodic task	9	add_periodictask
34	Can change periodic task	9	change_periodictask
35	Can delete periodic task	9	delete_periodictask
36	Can view periodic task	9	view_periodictask
37	Can add periodic tasks	10	add_periodictasks
38	Can change periodic tasks	10	change_periodictasks
39	Can delete periodic tasks	10	delete_periodictasks
40	Can view periodic tasks	10	view_periodictasks
41	Can add solar event	11	add_solarschedule
42	Can change solar event	11	change_solarschedule
43	Can delete solar event	11	delete_solarschedule
44	Can view solar event	11	view_solarschedule
45	Can add clocked	12	add_clockedschedule
46	Can change clocked	12	change_clockedschedule
47	Can delete clocked	12	delete_clockedschedule
48	Can view clocked	12	view_clockedschedule
49	Can add application	13	add_application
50	Can change application	13	change_application
51	Can delete application	13	delete_application
52	Can view application	13	view_application
53	Can add access token	14	add_accesstoken
54	Can change access token	14	change_accesstoken
55	Can delete access token	14	delete_accesstoken
56	Can view access token	14	view_accesstoken
57	Can add grant	15	add_grant
58	Can change grant	15	change_grant
59	Can delete grant	15	delete_grant
60	Can view grant	15	view_grant
61	Can add refresh token	16	add_refreshtoken
62	Can change refresh token	16	change_refreshtoken
63	Can delete refresh token	16	delete_refreshtoken
64	Can view refresh token	16	view_refreshtoken
65	Can add association	17	add_association
66	Can change association	17	change_association
67	Can delete association	17	delete_association
68	Can view association	17	view_association
69	Can add code	18	add_code
70	Can change code	18	change_code
71	Can delete code	18	delete_code
72	Can view code	18	view_code
73	Can add nonce	19	add_nonce
74	Can change nonce	19	change_nonce
75	Can delete nonce	19	delete_nonce
76	Can view nonce	19	view_nonce
77	Can add user social auth	20	add_usersocialauth
78	Can change user social auth	20	change_usersocialauth
79	Can delete user social auth	20	delete_usersocialauth
80	Can view user social auth	20	view_usersocialauth
81	Can add partial	21	add_partial
82	Can change partial	21	change_partial
83	Can delete partial	21	delete_partial
84	Can view partial	21	view_partial
85	Can add exchange backend	22	add_exchangebackend
86	Can change exchange backend	22	change_exchangebackend
87	Can delete exchange backend	22	delete_exchangebackend
88	Can view exchange backend	22	view_exchangebackend
89	Can add rate	23	add_rate
90	Can change rate	23	change_rate
91	Can delete rate	23	delete_rate
92	Can view rate	23	view_rate
93	Can add user	24	add_user
94	Can change user	24	change_user
95	Can delete user	24	delete_user
96	Can view user	24	view_user
97	Can add billing address	25	add_billingaddress
98	Can change billing address	25	change_billingaddress
99	Can delete billing address	25	delete_billingaddress
100	Can view billing address	25	view_billingaddress
101	Can add shipping address	26	add_shippingaddress
102	Can change shipping address	26	change_shippingaddress
103	Can delete shipping address	26	delete_shippingaddress
104	Can view shipping address	26	view_shippingaddress
105	Can add profile	27	add_profile
106	Can change profile	27	change_profile
107	Can delete profile	27	delete_profile
108	Can view profile	27	view_profile
109	Can add password reset	28	add_passwordreset
110	Can change password reset	28	change_passwordreset
111	Can delete password reset	28	delete_passwordreset
112	Can view password reset	28	view_passwordreset
113	Can add email confirmation	29	add_emailconfirmation
114	Can change email confirmation	29	change_emailconfirmation
115	Can delete email confirmation	29	delete_emailconfirmation
116	Can view email confirmation	29	view_emailconfirmation
117	Can add brand	30	add_brand
118	Can change brand	30	change_brand
119	Can delete brand	30	delete_brand
120	Can view brand	30	view_brand
121	Can add filter properties	31	add_filterproperties
122	Can change filter properties	31	change_filterproperties
123	Can delete filter properties	31	delete_filterproperties
124	Can view filter properties	31	view_filterproperties
125	Can add MiddlePriceRange	32	add_middlepricerange
126	Can change MiddlePriceRange	32	change_middlepricerange
127	Can delete MiddlePriceRange	32	delete_middlepricerange
128	Can view MiddlePriceRange	32	view_middlepricerange
129	Can add PriceFilterCategory	33	add_pricefiltercategory
130	Can change PriceFilterCategory	33	change_pricefiltercategory
131	Can delete PriceFilterCategory	33	delete_pricefiltercategory
132	Can view PriceFilterCategory	33	view_pricefiltercategory
133	Can add product	34	add_product
134	Can change product	34	change_product
135	Can delete product	34	delete_product
136	Can view product	34	view_product
137	Can add FilterCategory	35	add_filtercategory
138	Can change FilterCategory	35	change_filtercategory
139	Can delete FilterCategory	35	delete_filtercategory
140	Can view FilterCategory	35	view_filtercategory
141	Can add Category	36	add_category
142	Can change Category	36	change_category
143	Can delete Category	36	delete_category
144	Can view Category	36	view_category
145	Can add answer	37	add_answer
146	Can change answer	37	change_answer
147	Can delete answer	37	delete_answer
148	Can view answer	37	view_answer
149	Can add comment on review	38	add_commentonreview
150	Can change comment on review	38	change_commentonreview
151	Can delete comment on review	38	delete_commentonreview
152	Can view comment on review	38	view_commentonreview
153	Can add filter values	39	add_filtervalues
154	Can change filter values	39	change_filtervalues
155	Can delete filter values	39	delete_filtervalues
156	Can view filter values	39	view_filtervalues
157	Can add report	40	add_report
158	Can change report	40	change_report
159	Can delete report	40	delete_report
160	Can view report	40	view_report
161	Can add product review	41	add_productreview
162	Can change product review	41	change_productreview
163	Can delete product review	41	delete_productreview
164	Can view product review	41	view_productreview
165	Can add faq	42	add_faq
166	Can change faq	42	change_faq
167	Can delete faq	42	delete_faq
168	Can view faq	42	view_faq
169	Can add abstract product	43	add_abstractproduct
170	Can change abstract product	43	change_abstractproduct
171	Can delete abstract product	43	delete_abstractproduct
172	Can view abstract product	43	view_abstractproduct
173	Can add product info	43	add_productinfo
174	Can change product info	43	change_productinfo
175	Can delete product info	43	delete_productinfo
176	Can view product info	43	view_productinfo
177	Can add answer	44	add_answer
178	Can change answer	44	change_answer
179	Can delete answer	44	delete_answer
180	Can view answer	44	view_answer
181	Can add brand	45	add_brand
182	Can change brand	45	change_brand
183	Can delete brand	45	delete_brand
184	Can view brand	45	view_brand
185	Can add Category	46	add_category
186	Can change Category	46	change_category
187	Can delete Category	46	delete_category
188	Can view Category	46	view_category
189	Can add comment on review	47	add_commentonreview
190	Can change comment on review	47	change_commentonreview
191	Can delete comment on review	47	delete_commentonreview
192	Can view comment on review	47	view_commentonreview
193	Can add faq	48	add_faq
194	Can change faq	48	change_faq
195	Can delete faq	48	delete_faq
196	Can view faq	48	view_faq
197	Can add FilterCategory	49	add_filtercategory
198	Can change FilterCategory	49	change_filtercategory
199	Can delete FilterCategory	49	delete_filtercategory
200	Can view FilterCategory	49	view_filtercategory
201	Can add filter values	50	add_filtervalues
202	Can change filter values	50	change_filtervalues
203	Can delete filter values	50	delete_filtervalues
204	Can view filter values	50	view_filtervalues
205	Can add MiddlePriceRange	51	add_middlepricerange
206	Can change MiddlePriceRange	51	change_middlepricerange
207	Can delete MiddlePriceRange	51	delete_middlepricerange
208	Can view MiddlePriceRange	51	view_middlepricerange
209	Can add PriceFilterCategory	52	add_pricefiltercategory
210	Can change PriceFilterCategory	52	change_pricefiltercategory
211	Can delete PriceFilterCategory	52	delete_pricefiltercategory
212	Can view PriceFilterCategory	52	view_pricefiltercategory
213	Can add sub category	53	add_subcategory
214	Can change sub category	53	change_subcategory
215	Can delete sub category	53	delete_subcategory
216	Can view sub category	53	view_subcategory
217	Can add report	54	add_report
218	Can change report	54	change_report
219	Can delete report	54	delete_report
220	Can view report	54	view_report
221	Can add product review	55	add_productreview
222	Can change product review	55	change_productreview
223	Can delete product review	55	delete_productreview
224	Can view product review	55	view_productreview
225	Can add product info	56	add_productinfo
226	Can change product info	56	change_productinfo
227	Can delete product info	56	delete_productinfo
228	Can view product info	56	view_productinfo
229	Can add product	57	add_product
230	Can change product	57	change_product
231	Can delete product	57	delete_product
232	Can view product	57	view_product
233	Can add filter properties	58	add_filterproperties
234	Can change filter properties	58	change_filterproperties
235	Can delete filter properties	58	delete_filterproperties
236	Can view filter properties	58	view_filterproperties
237	Can add seller	59	add_seller
238	Can change seller	59	change_seller
239	Can delete seller	59	delete_seller
240	Can view seller	59	view_seller
241	Can add product faq	48	add_productfaq
242	Can change product faq	48	change_productfaq
243	Can delete product faq	48	delete_productfaq
244	Can view product faq	48	view_productfaq
245	Can add product faq answer	44	add_productfaqanswer
246	Can change product faq answer	44	change_productfaqanswer
247	Can delete product faq answer	44	delete_productfaqanswer
248	Can view product faq answer	44	view_productfaqanswer
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, email, contact_number, first_name, last_name, date_of_birth, avatar, is_active, is_admin, is_superuser, is_email_verified, is_customer, is_seller, date_joined, md5_hash) FROM stdin;
1	argon2$argon2i$v=19$m=512,t=2,p=2$blNpeFNJTnZqTWpp$1jTp46fVKBDF97V2cBctag	\N	Orin_Morissette@gmail.com	+916787344559	tejpratap	singh	\N		t	f	f	f	t	f	2020-10-24 21:01:16.087962+05:30	2c16aa043632243af60407dd08cdaccd
2	argon2$argon2i$v=19$m=512,t=2,p=2$VjZrREFTT3JjNTFB$uXIF+Ug+i5hFDwkY7BfYOA	2020-10-24 21:04:08.242213+05:30	admin@shopit.com	+916545673456	\N	\N	\N		t	t	t	f	f	f	2020-10-24 21:03:44.276344+05:30	4f4cf5561954de57e66d29f22bcb6136
3	argon2$argon2i$v=19$m=512,t=2,p=2$NUNOOU1TOEpSemUx$8ZqMG7F8Gc0ApZsqGQbaYQ	\N	customer@ecommerce.com	+919345345689	+919345345689	user	1987-12-24	user/avatar/customer_auIQ5qD.jpeg	t	f	f	f	t	f	2020-10-24 21:05:55.280992+05:30	99d22a92ea199ea6bf6d81b1249272fd
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-10-24 21:04:43.098015+05:30	1	shopit	1	[{"added": {}}]	13	2
2	2020-10-25 21:25:36.190745+05:30	1	apple	2	[{"changed": {"fields": ["Tags"]}}]	45	2
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time, enabled) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-24 21:00:23.413999+05:30
2	contenttypes	0002_remove_content_type_name	2020-10-24 21:00:23.428882+05:30
3	auth	0001_initial	2020-10-24 21:00:23.495336+05:30
4	auth	0002_alter_permission_name_max_length	2020-10-24 21:00:23.510492+05:30
5	auth	0003_alter_user_email_max_length	2020-10-24 21:00:23.516491+05:30
6	auth	0004_alter_user_username_opts	2020-10-24 21:00:23.522086+05:30
7	auth	0005_alter_user_last_login_null	2020-10-24 21:00:23.529267+05:30
8	auth	0006_require_contenttypes_0002	2020-10-24 21:00:23.532941+05:30
9	auth	0007_alter_validators_add_error_messages	2020-10-24 21:00:23.544697+05:30
10	auth	0008_alter_user_username_max_length	2020-10-24 21:00:23.554767+05:30
11	auth	0009_alter_user_last_name_max_length	2020-10-24 21:00:23.563238+05:30
12	auth	0010_alter_group_name_max_length	2020-10-24 21:00:23.572312+05:30
13	auth	0011_update_proxy_permissions	2020-10-24 21:00:23.583333+05:30
14	auth	0012_alter_user_first_name_max_length	2020-10-24 21:00:23.595721+05:30
15	users	0001_create_user_model	2020-10-24 21:00:23.622146+05:30
16	admin	0001_initial	2020-10-24 21:00:23.647151+05:30
17	admin	0002_logentry_remove_auto_add	2020-10-24 21:00:23.658295+05:30
18	admin	0003_logentry_add_action_flag_choices	2020-10-24 21:00:23.665378+05:30
19	django_celery_beat	0001_initial	2020-10-24 21:00:23.68638+05:30
20	django_celery_beat	0002_auto_20161118_0346	2020-10-24 21:00:23.708226+05:30
21	django_celery_beat	0003_auto_20161209_0049	2020-10-24 21:00:23.719058+05:30
22	django_celery_beat	0004_auto_20170221_0000	2020-10-24 21:00:23.724017+05:30
23	django_celery_beat	0005_add_solarschedule_events_choices	2020-10-24 21:00:23.731454+05:30
24	django_celery_beat	0006_auto_20180322_0932	2020-10-24 21:00:23.773578+05:30
25	django_celery_beat	0007_auto_20180521_0826	2020-10-24 21:00:23.788979+05:30
26	django_celery_beat	0008_auto_20180914_1922	2020-10-24 21:00:23.805875+05:30
27	django_celery_beat	0006_auto_20180210_1226	2020-10-24 21:00:23.815577+05:30
28	django_celery_beat	0006_periodictask_priority	2020-10-24 21:00:23.820954+05:30
29	django_celery_beat	0009_periodictask_headers	2020-10-24 21:00:23.827443+05:30
30	django_celery_beat	0010_auto_20190429_0326	2020-10-24 21:00:23.938234+05:30
31	django_celery_beat	0011_auto_20190508_0153	2020-10-24 21:00:23.948402+05:30
32	django_celery_beat	0012_periodictask_expire_seconds	2020-10-24 21:00:23.956601+05:30
33	exchange	0001_initial	2020-10-24 21:00:23.970271+05:30
34	oauth2_provider	0001_initial	2020-10-24 21:00:24.041938+05:30
35	oauth2_provider	0002_auto_20190406_1805	2020-10-24 21:00:24.083017+05:30
40	sessions	0001_initial	2020-10-24 21:00:24.594565+05:30
41	sites	0001_initial	2020-10-24 21:00:24.605615+05:30
42	sites	0002_alter_domain_unique	2020-10-24 21:00:24.613803+05:30
43	default	0001_initial	2020-10-24 21:00:24.691155+05:30
44	social_auth	0001_initial	2020-10-24 21:00:24.692141+05:30
45	default	0002_add_related_name	2020-10-24 21:00:24.726728+05:30
46	social_auth	0002_add_related_name	2020-10-24 21:00:24.727858+05:30
47	default	0003_alter_email_max_length	2020-10-24 21:00:24.733573+05:30
48	social_auth	0003_alter_email_max_length	2020-10-24 21:00:24.734726+05:30
49	default	0004_auto_20160423_0400	2020-10-24 21:00:24.754298+05:30
50	social_auth	0004_auto_20160423_0400	2020-10-24 21:00:24.758116+05:30
51	social_auth	0005_auto_20160727_2333	2020-10-24 21:00:24.764612+05:30
52	social_django	0006_partial	2020-10-24 21:00:24.771861+05:30
53	social_django	0007_code_timestamp	2020-10-24 21:00:24.780184+05:30
54	social_django	0008_partial_timestamp	2020-10-24 21:00:24.790829+05:30
55	social_django	0009_auto_20191118_0520	2020-10-24 21:00:24.861993+05:30
56	social_django	0010_uid_db_index	2020-10-24 21:00:24.88567+05:30
57	users	0002_alter_contact_field	2020-10-24 21:00:24.99941+05:30
58	users	0003_billingaddress_customer_shippingaddress	2020-10-24 21:00:25.060799+05:30
59	users	0004_chnage_user_avatar_to_blank_and_null_field	2020-10-24 21:00:25.147139+05:30
60	users	0005_auto_20201016_2230	2020-10-24 21:00:25.304267+05:30
61	users	0006_add_md5_hash_field	2020-10-24 21:00:25.324863+05:30
62	users	0007_add_password_reset_model	2020-10-24 21:00:25.40243+05:30
63	users	0008_auto_20201021_2108	2020-10-24 21:00:25.468388+05:30
64	users	0009_auto_20201021_2108	2020-10-24 21:00:25.510878+05:30
65	users	0010_update_uuid_field	2020-10-24 21:00:25.590929+05:30
66	users	0011_auto_20201021_2147	2020-10-24 21:00:25.672482+05:30
67	users	0012_auto_20201024_2056	2020-10-24 21:00:25.809201+05:30
68	social_django	0003_alter_email_max_length	2020-10-24 21:00:25.812717+05:30
69	social_django	0004_auto_20160423_0400	2020-10-24 21:00:25.814651+05:30
70	social_django	0005_auto_20160727_2333	2020-10-24 21:00:25.816428+05:30
71	social_django	0002_add_related_name	2020-10-24 21:00:25.817885+05:30
72	social_django	0001_initial	2020-10-24 21:00:25.819262+05:30
73	users	0013_auto_20201024_2116	2020-10-24 21:16:46.678757+05:30
75	users	0014_auto_20201024_2205	2020-10-24 22:06:04.727266+05:30
77	users	0015_auto_20201024_2228	2020-10-24 22:28:20.559785+05:30
79	users	0016_auto_20201024_2231	2020-10-24 22:31:43.903534+05:30
80	users	0017_auto_20201024_2254	2020-10-24 22:55:05.19426+05:30
82	users	0018_auto_20201024_2313	2020-10-25 00:03:49.545357+05:30
83	users	0019_create_brand_category_model	2020-10-25 00:03:49.581021+05:30
84	users	0020_create_product_model	2020-10-25 00:03:49.610336+05:30
85	shopit	0001_create_brand_category_model	2020-10-25 00:03:49.689216+05:30
86	shopit	0002_create_product_model	2020-10-25 00:03:49.971229+05:30
87	shopit	0003_auto_20201025_2050	2020-10-25 20:50:27.126729+05:30
88	users	0021_auto_20201025_2050	2020-10-25 20:50:27.169354+05:30
89	shopit	0004_auto_20201025_2115	2020-10-25 21:15:18.734211+05:30
90	users	0022_auto_20201025_2115	2020-10-25 21:15:18.815649+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
smphveql4g73yi18pjy0hvq8vakmv1hw	.eJxVjEEOwiAQRe_C2hBKcSgu3fcMzcwwSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmqO6KKtOvxshP6TsIN6x3KrmWtZlJr0r-qBNjzXK83q4fwcZW_7WSA5CSJ65S-zADZI8IQCdk0dPIl0AY9nwEMR66VMEb1jAOJLUi1PvDwhkONo:1kWLYW:-5X8Con2j5WGjLVlr5T1nAS88WRNlThqfDZxRi9wJFg	2020-11-07 21:04:08.51083+05:30
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: exchange_exchangebackend; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_exchangebackend (name, last_update, base_currency) FROM stdin;
\.


--
-- Data for Name: exchange_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_rate (id, currency, value, backend_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
1	3aPRby860zLnX6n7wFT5EX75ypUJBDegRVpywtBz		confidential	password	W57NwPN6052joOgtrG0WfFeTwN2IK3MzAe7iZBCGwC4W8FyQ9Vm1YJkfDVk2cfc1HtkosFt085TkWA5uLuWRljk9A3CcD1w1vFcGSNM7NAfYb3Wu2GEpIyNsu5t2f1qR	shopit	2	f	2020-10-24 21:04:43.061585+05:30	2020-10-24 21:04:43.061635+05:30
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
1	RQ6fLndwJl2ftQgugxoDCKQD9s0FGz	2020-10-25 21:06:03.910426+05:30	read write	1	3	2020-10-24 21:06:03.911985+05:30	2020-10-24 21:06:03.912028+05:30	\N
2	0dW1w50zxjISifH86QMkOvECIsUrLh	2020-10-25 21:06:10.107706+05:30	read write	1	3	2020-10-24 21:06:10.108706+05:30	2020-10-24 21:06:10.108745+05:30	\N
3	lQl5u2AqTN9mDLSy4tawGjBiG88XPR	2020-10-26 04:16:20.410662+05:30	read write	1	2	2020-10-25 04:16:20.412163+05:30	2020-10-25 04:16:20.412214+05:30	\N
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated, code_challenge, code_challenge_method) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
1	z4O4GqIlGDyKFcoJDlJbFDbWf7uROI	1	1	3	2020-10-24 21:06:03.953409+05:30	2020-10-24 21:06:03.953456+05:30	\N
2	zM8gqw1OjBUqCrihUx8ABTOwasUhz6	2	1	3	2020-10-24 21:06:10.174913+05:30	2020-10-24 21:06:10.17496+05:30	\N
3	D2RYulmxq1A87dJsdWpnYdd9nBMA7q	3	1	2	2020-10-25 04:16:20.464284+05:30	2020-10-25 04:16:20.464331+05:30	\N
\.


--
-- Data for Name: shopit_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_brand (id, name, image, tags, created_at, updated_at) FROM stdin;
1	apple		{mac,laptop}	2020-10-25 04:19:05.557723+05:30	2020-10-25 21:25:36.1519+05:30
\.


--
-- Data for Name: shopit_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_category (id, name, tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_category_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_category_brand (id, category_id, brand_id) FROM stdin;
\.


--
-- Data for Name: shopit_commentonreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_commentonreview (id, comment, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: shopit_filtercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_filtercategory (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_filterproperties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_filterproperties (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_filtercategory_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_filtercategory_properties (id, filtercategory_id, filterproperties_id) FROM stdin;
\.


--
-- Data for Name: shopit_filtervalues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_filtervalues (id, value) FROM stdin;
\.


--
-- Data for Name: shopit_filterproperties_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_filterproperties_value (id, filterproperties_id, filtervalues_id) FROM stdin;
\.


--
-- Data for Name: shopit_middlepricerange; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_middlepricerange (id, name, start_price_currency, start_price, end_price_currency, end_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_pricefiltercategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_pricefiltercategory (id, name, under_price_currency, under_price, middle_price_currency, middle_price, above_price_currency, above_price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_productinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productinfo (id, name, image, is_available, stoke, description, tags, product_detail, created_at, updated_at, brand_id, category_id) FROM stdin;
\.


--
-- Data for Name: shopit_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_product (id, media, purchase_option, filter_details, original_price_currency, original_price, current_price_currency, current_price, created_at, updated_at, info_id) FROM stdin;
\.


--
-- Data for Name: shopit_productfaq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productfaq (id, question, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: shopit_productfaqanswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productfaqanswer (id, answer, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: shopit_productfaq_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productfaq_answer (id, productfaq_id, productfaqanswer_id) FROM stdin;
\.


--
-- Data for Name: shopit_productinfo_faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productinfo_faq (id, productinfo_id, productfaq_id) FROM stdin;
\.


--
-- Data for Name: shopit_productreview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productreview (id, rating, description, is_verified_purchase, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shopit_productinfo_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productinfo_review (id, productinfo_id, productreview_id) FROM stdin;
\.


--
-- Data for Name: users_shippingaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_shippingaddress (id, room, address1, address2, city, state, country, postal_code, contact_number, fax, email, extra_information) FROM stdin;
\.


--
-- Data for Name: users_seller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_seller (id, name, tags, seller_address_id, user_id) FROM stdin;
\.


--
-- Data for Name: shopit_productinfo_seller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productinfo_seller (id, productinfo_id, seller_id) FROM stdin;
\.


--
-- Data for Name: shopit_subcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_subcategory (id, name) FROM stdin;
\.


--
-- Data for Name: shopit_productinfo_sub_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productinfo_sub_category (id, productinfo_id, subcategory_id) FROM stdin;
\.


--
-- Data for Name: shopit_productreview_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productreview_comments (id, productreview_id, commentonreview_id) FROM stdin;
\.


--
-- Data for Name: shopit_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_report (id, description, is_critical, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: shopit_productreview_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productreview_report (id, productreview_id, report_id) FROM stdin;
\.


--
-- Data for Name: shopit_productreview_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_productreview_user (id, productreview_id, user_id) FROM stdin;
\.


--
-- Data for Name: shopit_subcategory_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_subcategory_category (id, subcategory_id, category_id) FROM stdin;
\.


--
-- Data for Name: shopit_subcategory_filter_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_subcategory_filter_category (id, subcategory_id, filtercategory_id) FROM stdin;
\.


--
-- Data for Name: shopit_subcategory_price_filter_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopit_subcategory_price_filter_category (id, subcategory_id, pricefiltercategory_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: users_billingaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_billingaddress (id, room, address1, address2, city, state, country, postal_code, contact_number, fax, email, card_number, card_expiry, security_field) FROM stdin;
1	34	near state bank of india	\N	rath	uttar pradesh	IN	210431	+919634567934	\N	conect@customer.com	1111222244443333	2020-12-31	345
3	34	near state bank of india	\N	rath	uttar pradesh	IN	210431	+919634567934	\N	conect@customer.com	1111222244443333	2020-12-31	345
\.


--
-- Data for Name: users_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_emailconfirmation (id, token, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: users_passwordreset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_passwordreset (id, url_token, success_token, created_at, user_id) FROM stdin;
bf6150f1-4eec-42b7-84d9-dbeb2879ff52	1D1aC8rSH9QKX_OOmeKtTDWth2giWGWHHcUr7XSY0O4	\N	2020-10-24 21:07:28.933747+05:30	3
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile (id, default_shipping_address, default_purchasing_address, user_id) FROM stdin;
1	0	0	1
2	0	0	2
3	0	0	3
\.


--
-- Data for Name: users_profile_billing_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile_billing_address (id, profile_id, billingaddress_id) FROM stdin;
1	3	1
3	3	3
\.


--
-- Data for Name: users_profile_shipping_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile_shipping_address (id, profile_id, shippingaddress_id) FROM stdin;
\.


--
-- Data for Name: users_seller_billing_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_seller_billing_address (id, seller_id, billingaddress_id) FROM stdin;
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 248, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2, true);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 59, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 72, true);


--
-- Name: django_migrations_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq1', 90, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: exchange_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_rate_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 3, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 3, true);


--
-- Name: shopit_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_answer_id_seq', 1, false);


--
-- Name: shopit_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_brand_id_seq', 1, true);


--
-- Name: shopit_category_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_category_brand_id_seq', 1, false);


--
-- Name: shopit_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_category_id_seq', 1, false);


--
-- Name: shopit_commentonreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_commentonreview_id_seq', 1, false);


--
-- Name: shopit_faq_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_faq_answer_id_seq', 1, false);


--
-- Name: shopit_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_faq_id_seq', 1, false);


--
-- Name: shopit_filtercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_filtercategory_id_seq', 1, false);


--
-- Name: shopit_filtercategory_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_filtercategory_properties_id_seq', 1, false);


--
-- Name: shopit_filterproperties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_filterproperties_id_seq', 1, false);


--
-- Name: shopit_filterproperties_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_filterproperties_value_id_seq', 1, false);


--
-- Name: shopit_filtervalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_filtervalues_id_seq', 1, false);


--
-- Name: shopit_middlepricerange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_middlepricerange_id_seq', 1, false);


--
-- Name: shopit_pricefiltercategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_pricefiltercategory_id_seq', 1, false);


--
-- Name: shopit_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_product_id_seq', 1, false);


--
-- Name: shopit_productinfo_faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productinfo_faq_id_seq', 1, false);


--
-- Name: shopit_productinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productinfo_id_seq', 1, false);


--
-- Name: shopit_productinfo_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productinfo_review_id_seq', 1, false);


--
-- Name: shopit_productinfo_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productinfo_seller_id_seq', 1, false);


--
-- Name: shopit_productinfo_sub_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productinfo_sub_category_id_seq', 1, false);


--
-- Name: shopit_productreview_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productreview_comments_id_seq', 1, false);


--
-- Name: shopit_productreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productreview_id_seq', 1, false);


--
-- Name: shopit_productreview_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productreview_report_id_seq', 1, false);


--
-- Name: shopit_productreview_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_productreview_user_id_seq', 1, false);


--
-- Name: shopit_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_report_id_seq', 1, false);


--
-- Name: shopit_subcategory_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_subcategory_category_id_seq', 1, false);


--
-- Name: shopit_subcategory_filter_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_subcategory_filter_category_id_seq', 1, false);


--
-- Name: shopit_subcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_subcategory_id_seq', 1, false);


--
-- Name: shopit_subcategory_price_filter_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopit_subcategory_price_filter_category_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: users_billingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_billingaddress_id_seq', 3, true);


--
-- Name: users_customer_billing_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_billing_address_id_seq', 3, true);


--
-- Name: users_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_id_seq', 3, true);


--
-- Name: users_customer_shipping_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_customer_shipping_address_id_seq', 1, false);


--
-- Name: users_seller_billing_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seller_billing_address_id_seq', 1, false);


--
-- Name: users_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seller_id_seq', 1, false);


--
-- Name: users_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_shippingaddress_id_seq', 1, false);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

