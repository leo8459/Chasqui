PGDMP     6    *                |            _delivery_db    13.15    13.15 L               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16395    _delivery_db    DATABASE     j   CREATE DATABASE _delivery_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Bolivia.1252';
    DROP DATABASE _delivery_db;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    16396    address    TABLE     n  CREATE TABLE public.address (
    id bigint NOT NULL,
    id_user bigint NOT NULL,
    address character varying(255) NOT NULL,
    neighborhood character varying(255) NOT NULL,
    lat numeric DEFAULT 0,
    lng numeric DEFAULT 0,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    direccion text
);
    DROP TABLE public.address;
       public         heap    postgres    false    3            �            1259    16404    address_id_seq    SEQUENCE     w   CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          postgres    false    200    3                       0    0    address_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;
          public          postgres    false    201            �            1259    16406 
   categories    TABLE        CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying(180) NOT NULL,
    image character varying(255) NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false    3            �            1259    16409    categories_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    202    3                       0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    203            �            1259    16411    order_has_products    TABLE     �   CREATE TABLE public.order_has_products (
    id_order bigint NOT NULL,
    id_product bigint NOT NULL,
    quantity bigint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 &   DROP TABLE public.order_has_products;
       public         heap    postgres    false    3            �            1259    16414    orders    TABLE     �  CREATE TABLE public.orders (
    id bigint NOT NULL,
    id_client bigint NOT NULL,
    id_delivery bigint,
    id_address bigint NOT NULL,
    lat numeric DEFAULT 0,
    lng numeric DEFAULT 0,
    status character varying(90) NOT NULL,
    "timestamp" bigint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false    3            �            1259    16422    orders_id_seq    SEQUENCE     v   CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    205    3                       0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    206            �            1259    16424    products    TABLE     �  CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(180) NOT NULL,
    description character varying(255) NOT NULL,
    price numeric DEFAULT 0,
    image1 character varying(255),
    image2 character varying(255),
    image3 character varying(255),
    id_category bigint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    3            �            1259    16431    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    3    207                       0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    208            �            1259    16433    roles    TABLE       CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(180) NOT NULL,
    image character varying(255),
    route character varying(255),
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false    3            �            1259    16439    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    3    209                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    210            �            1259    16441    user_has_roles    TABLE     �   CREATE TABLE public.user_has_roles (
    id_user bigint NOT NULL,
    id_rol bigint NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 "   DROP TABLE public.user_has_roles;
       public         heap    postgres    false    3            �            1259    16444    user_has_roles_id_rol_seq    SEQUENCE     �   CREATE SEQUENCE public.user_has_roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.user_has_roles_id_rol_seq;
       public          postgres    false    3    211                       0    0    user_has_roles_id_rol_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.user_has_roles_id_rol_seq OWNED BY public.user_has_roles.id_rol;
          public          postgres    false    212            �            1259    16446    user_has_roles_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.user_has_roles_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.user_has_roles_id_user_seq;
       public          postgres    false    211    3                        0    0    user_has_roles_id_user_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.user_has_roles_id_user_seq OWNED BY public.user_has_roles.id_user;
          public          postgres    false    213            �            1259    16448    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    phone character varying(80) NOT NULL,
    image character varying(255),
    password character varying(255) NOT NULL,
    is_available boolean,
    session_token character varying(255),
    created_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    3            �            1259    16454    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    3    214            !           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            S           2604    16456 
   address id    DEFAULT     h   ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);
 9   ALTER TABLE public.address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200            T           2604    16457    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            W           2604    16458 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            Y           2604    16459    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207            Z           2604    16460    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            [           2604    16461    user_has_roles id_user    DEFAULT     �   ALTER TABLE ONLY public.user_has_roles ALTER COLUMN id_user SET DEFAULT nextval('public.user_has_roles_id_user_seq'::regclass);
 E   ALTER TABLE public.user_has_roles ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    213    211            \           2604    16462    user_has_roles id_rol    DEFAULT     ~   ALTER TABLE ONLY public.user_has_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.user_has_roles_id_rol_seq'::regclass);
 D   ALTER TABLE public.user_has_roles ALTER COLUMN id_rol DROP DEFAULT;
       public          postgres    false    212    211            ]           2604    16463    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                      0    16396    address 
   TABLE DATA           r   COPY public.address (id, id_user, address, neighborhood, lat, lng, created_at, updated_at, direccion) FROM stdin;
    public          postgres    false    200   �\                 0    16406 
   categories 
   TABLE DATA           M   COPY public.categories (id, name, image, created_at, updated_at) FROM stdin;
    public          postgres    false    202   ]                 0    16411    order_has_products 
   TABLE DATA           d   COPY public.order_has_products (id_order, id_product, quantity, created_at, updated_at) FROM stdin;
    public          postgres    false    204   �]                 0    16414    orders 
   TABLE DATA              COPY public.orders (id, id_client, id_delivery, id_address, lat, lng, status, "timestamp", created_at, updated_at) FROM stdin;
    public          postgres    false    205   �]       
          0    16424    products 
   TABLE DATA           }   COPY public.products (id, name, description, price, image1, image2, image3, id_category, created_at, updated_at) FROM stdin;
    public          postgres    false    207   ^                 0    16433    roles 
   TABLE DATA           O   COPY public.roles (id, name, image, route, created_at, updated_at) FROM stdin;
    public          postgres    false    209   �^                 0    16441    user_has_roles 
   TABLE DATA           Q   COPY public.user_has_roles (id_user, id_rol, created_at, updated_at) FROM stdin;
    public          postgres    false    211   �_                 0    16448    users 
   TABLE DATA           �   COPY public.users (id, email, name, lastname, phone, image, password, is_available, session_token, created_at, updated_at) FROM stdin;
    public          postgres    false    214   ^`       "           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 73, true);
          public          postgres    false    201            #           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 15, true);
          public          postgres    false    203            $           0    0    orders_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.orders_id_seq', 112, true);
          public          postgres    false    206            %           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 83, true);
          public          postgres    false    208            &           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    210            '           0    0    user_has_roles_id_rol_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.user_has_roles_id_rol_seq', 1, false);
          public          postgres    false    212            (           0    0    user_has_roles_id_user_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.user_has_roles_id_user_seq', 1, false);
          public          postgres    false    213            )           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 33, true);
          public          postgres    false    215            _           2606    16465    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    200            a           2606    16467    categories categories_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_name_key;
       public            postgres    false    202            c           2606    16469    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    202            e           2606    16471 *   order_has_products order_has_products_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.order_has_products
    ADD CONSTRAINT order_has_products_pkey PRIMARY KEY (id_order, id_product);
 T   ALTER TABLE ONLY public.order_has_products DROP CONSTRAINT order_has_products_pkey;
       public            postgres    false    204    204            g           2606    16473    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    205            i           2606    16475    products products_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_name_key;
       public            postgres    false    207            k           2606    16477    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    207            m           2606    16479    roles roles_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_key;
       public            postgres    false    209            o           2606    16481    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    209            q           2606    16483 "   user_has_roles user_has_roles_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.user_has_roles
    ADD CONSTRAINT user_has_roles_pkey PRIMARY KEY (id_user, id_rol);
 L   ALTER TABLE ONLY public.user_has_roles DROP CONSTRAINT user_has_roles_pkey;
       public            postgres    false    211    211            s           2606    16485    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    214            u           2606    16487    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    214            w           2606    16489    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            x           2606    16490    address address_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_id_user_fkey;
       public          postgres    false    2935    200    214            y           2606    16495 3   order_has_products order_has_products_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_has_products
    ADD CONSTRAINT order_has_products_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.order_has_products DROP CONSTRAINT order_has_products_id_order_fkey;
       public          postgres    false    205    204    2919            z           2606    16500 5   order_has_products order_has_products_id_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_has_products
    ADD CONSTRAINT order_has_products_id_product_fkey FOREIGN KEY (id_product) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.order_has_products DROP CONSTRAINT order_has_products_id_product_fkey;
       public          postgres    false    204    2923    207            {           2606    16505    orders orders_id_address_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_address_fkey FOREIGN KEY (id_address) REFERENCES public.address(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_address_fkey;
       public          postgres    false    2911    200    205            |           2606    16510    orders orders_id_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_client_fkey;
       public          postgres    false    205    214    2935            }           2606    16515    orders orders_id_delivery_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_id_delivery_fkey FOREIGN KEY (id_delivery) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_id_delivery_fkey;
       public          postgres    false    214    2935    205            ~           2606    16520 "   products products_id_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_category_fkey FOREIGN KEY (id_category) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_id_category_fkey;
       public          postgres    false    2915    207    202                       2606    16525 )   user_has_roles user_has_roles_id_rol_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_has_roles
    ADD CONSTRAINT user_has_roles_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.user_has_roles DROP CONSTRAINT user_has_roles_id_rol_fkey;
       public          postgres    false    2927    209    211            �           2606    16530 *   user_has_roles user_has_roles_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_has_roles
    ADD CONSTRAINT user_has_roles_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.user_has_roles DROP CONSTRAINT user_has_roles_id_user_fkey;
       public          postgres    false    211    214    2935                  x������ � �         �   x�m�A�0E�p
V�J;H)��`���0�Dp��!��׮����`�+��G��X'ܧȞ)��k��@F�I�T�"�B�9���z3z�/I��Do>���%z��_&���}�uP5�9�g\�i����E�vn0�����Gp
[�����bC��f��je�[@����s�������C            x������ � �            x������ � �      
   �   x��ο
�0�9y�{����`��$88w9�P�M
�3�j���	
"���-�����ĉmۃu��4�����Ā/�����~m�>&)���ng�6-sx� �-��kPRTdJgD������W&K��E�]�\�2~�<_�� �xX�{V�����)�\J� ���F         �   x����j�@ ��W����Ν�E0$
�i��"Y(*��9�6�-�mv���rj�Kî�:��r�a��p����ʃ@��A���
R9�S�I�������ܳ�9�i��mLLr)wB�~�|��v�dM{�����큇�@s@ʐϑ�&UN�����2�E�ފ�G�-=�m&����S�o5(�ôMA���Ҝ�H�B��"uY"�IR�E͓s�c�}	-kZ�Y��EQ� Pˌ�         �   x����B!DϤ
�I6������Qs�����B�		+\�pueG���.�"Rؖ����En�y�kyR��#b�ko~��ܾ�a�q6_Yĵy�#}m~
�0��F*G�͵�Z�H�6sF�H�� �e��p���FD$8Z         �  x���[��H���Wx1�:E�� r�I�Ԁ
������tf�N�𽩪T��@8�U\�uμ8�E�o�eq��G�	�!p���5���������2=��!��R@3�>�^�J˹U|�p�u��<����=�D�c�pA �	 '���e#HaeX�O��%��Ң	�aWɰv�;5jfd��F-���JӇ}�T��"{I;�
�r�O�v� |̗msvr䯂X�e��%\��Zʷd��(�R:���N�A��$��{|��ȳ�I��3O�ձq��V2����4:�U3h�ĸk&�����m/:�O쥨	�jb˓��Vb���@*�q�,��3��N��$��� G�A�Ī"����G�5��:~<��#$E?!�SR��	�*����m��xc%�q���:�J�r'J����,������·dy����]]�6�1�- ))Z��:,��F2��$�6�E��톮�C�)<��87����t��v�F�g��X��^��G=�ޯq=�F��QO�nvԟ8}o%V�V�O���ඬ�,Y:��<2���)]g���D��g�Z�d\�o�� �XYȥ����H5]�.�NM���)�UҌ�P�>z�o ��ޙ�D&��cv^�>^���XPd>�F�d�Č0Ì�Ș�7jO�
1��}�(*�;E+��Og��Rop/*��C��7��p��U�}��Y{��>X��3m9õ~v<#J��4Jك��B��8���&��cigMTU^~cq<C��ѝ$�|� |<dC��^>�EVA��m$CA�	���M�۳Vs�.{Y���l���@�2|sj�	�ƅ��n�
��-��.	���é6ܗV�����kqeu��t�ze\���Xa�\Ct۫�J�+�a��?�"�A���O�BX�^u��ųo�eج������s��az�y1='9�����Q3���';��ҵ'N7���Au�v�͛ӗ���}�gZd��b� u��[�O[�9{y+���ʞ�}�jC1�tc	ꦴ~��`�1�p��p�Y6\J"�Y�G�Ńw��1F�f(��W��-v�U��Wi�y$����嶔�m60<��Ev�b'-ht��W��|��+g^���u��R�L��UR�)���&oy3��B��yA��5B���LοZ�~�(�d^���=�F� ����     