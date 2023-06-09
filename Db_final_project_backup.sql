PGDMP     9    (                {            Db_final_project    15.2    15.2 '    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    16398    Db_final_project    DATABASE     �   CREATE DATABASE "Db_final_project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 "   DROP DATABASE "Db_final_project";
                postgres    false            X           1247    16485    bid_status_enum    TYPE     o   CREATE TYPE public.bid_status_enum AS ENUM (
    'Pending',
    'Accepted',
    'Cancelled',
    'Rejected'
);
 "   DROP TYPE public.bid_status_enum;
       public          postgres    false            R           1247    16458    product_status_enum    TYPE     M   CREATE TYPE public.product_status_enum AS ENUM (
    'Open',
    'Closed'
);
 &   DROP TYPE public.product_status_enum;
       public          postgres    false            �            1259    16494    bids    TABLE       CREATE TABLE public.bids (
    id integer NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL,
    bid_price numeric(15,2) NOT NULL,
    bid_status public.bid_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.bids;
       public         heap    postgres    false    856            �            1259    16493    bids_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.bids_id_seq;
       public          postgres    false    221            )           0    0    bids_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.bids_id_seq OWNED BY public.bids.id;
          public          postgres    false    220            �            1259    16437 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    city_name character varying(255) NOT NULL,
    latitude numeric(15,8) NOT NULL,
    longitude numeric(15,8) NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16436    locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    215            *           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    214            �            1259    16464    products    TABLE     {  CREATE TABLE public.products (
    id integer NOT NULL,
    user_id integer NOT NULL,
    car_brand character varying(255) NOT NULL,
    car_model character varying(255) NOT NULL,
    car_body_type character varying(255) NOT NULL,
    car_transmission_type character varying(255) NOT NULL,
    car_year integer NOT NULL,
    car_color character varying(255) NOT NULL,
    car_mileage integer NOT NULL,
    car_price numeric(15,2) NOT NULL,
    location_id integer NOT NULL,
    allow_bidding boolean NOT NULL,
    product_status public.product_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    850            �            1259    16463    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    219            +           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    218            �            1259    16444    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    location_id integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16443    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            ,           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            ~           2604    16497    bids id    DEFAULT     b   ALTER TABLE ONLY public.bids ALTER COLUMN id SET DEFAULT nextval('public.bids_id_seq'::regclass);
 6   ALTER TABLE public.bids ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            z           2604    16440    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            |           2604    16467    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            {           2604    16447    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            "          0    16494    bids 
   TABLE DATA           Z   COPY public.bids (id, product_id, user_id, bid_price, bid_status, created_at) FROM stdin;
    public          postgres    false    221   s-                 0    16437 	   locations 
   TABLE DATA           G   COPY public.locations (id, city_name, latitude, longitude) FROM stdin;
    public          postgres    false    215   ?                  0    16464    products 
   TABLE DATA           �   COPY public.products (id, user_id, car_brand, car_model, car_body_type, car_transmission_type, car_year, car_color, car_mileage, car_price, location_id, allow_bidding, product_status, created_at) FROM stdin;
    public          postgres    false    219   �@                 0    16444    users 
   TABLE DATA           D   COPY public.users (id, name, email, phone, location_id) FROM stdin;
    public          postgres    false    217   U       -           0    0    bids_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.bids_id_seq', 4, true);
          public          postgres    false    220            .           0    0    locations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.locations_id_seq', 1, false);
          public          postgres    false    214            /           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    218            0           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    216            �           2606    16500    bids bids_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_pkey;
       public            postgres    false    221            �           2606    16442    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    215            �           2606    16473    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    219            �           2606    16451    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           2606    16501    bids bids_product_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);
 C   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_product_id_fkey;
       public          postgres    false    3205    221    219            �           2606    16506    bids bids_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.bids DROP CONSTRAINT bids_user_id_fkey;
       public          postgres    false    217    3203    221            �           2606    16479 "   products products_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);
 L   ALTER TABLE ONLY public.products DROP CONSTRAINT products_location_id_fkey;
       public          postgres    false    3201    215    219            �           2606    16474    products products_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.products DROP CONSTRAINT products_user_id_fkey;
       public          postgres    false    3203    219    217            �           2606    16452    users users_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_location_id_fkey;
       public          postgres    false    215    217    3201            "      x��]I�e��Z�7`C}�Yv�d�A&F�?�sxL��gj��Q�!�����g���~I���o���_���)�ԟS�9՟R��~��uON�����}. 8�idEp~�Ӟ���}Q���}?,RL���)�%pS?����5��s�>��?��g9O9-��RP�?ž�~J:F�b����jiTI���v��4�@�e=�����\1-0���w�ߕ������~���5��~��8������㤖N�J�q�jy����z�e�m��zdh-C�q�n���hZ�F�v�r��� ��A��tV4-���*o˓���j�E����C�ok@pL1�f+�wL�
J�h�2���TXaY�W[y������e�ǟ�#�JN<Jq�n��s�`�� �go��[D�,,i8Om��E�R���	b�!�A��y�Z�ǍFpE�?\S��oߟp�-���A@���T�|�]�c���;*�GG�"Pz���r$���5?;�۽�{��"P2�~NȰ*�H#�`�ӣ>�p�Ee��`9ǎ>���(�`~���%X������XQEc�T��ϊZ�W�f�?;���J�c=f��᯾��|�����R��v�'�wE �v�
 3aEǵ͓M�y�A03 �N�P��'$��Y;&G2����I͵�4�I�Z0Y�]�!mʬi��9�t����)�b�� A/���r�sB��V0���G�S���'�T�Ƴ�υ�Ղi6m}+��Q��Vt��Ge��N@*�2xAIG�2�yx�v�����b�ԺO̳$x�ˁt=r������i�=�5��{���c��,F�`���)�yv�Ͱ��%���7�~T��
Z�
��;���X�����v
��EΓ�	�� r��Bi�ʘ��{2�C�Ll����%rʐ��q��P��na�I~�vqF�X��-y�cǨ͑P&��b�U�G��H��M|�l:�d����?��,k���������ph�$9Qw$�Ɣ΄g�u��_���f�ݽY�}��Y��4�Ὄ�J�g�>�(���r�?����j��3����f�͈��0���E�3m��X�%��p^�6#��f��#�$��M.ZaMZ$��UXtg���(ٶ(��*A(�f:p	�HrR�u{�Gz��|�*u3XQW$I����&X�N6�����4���T��8�d�䰱��H��`��V8Ǧ�.&2�1Y�G�C�la�4
_��j�5��E\
F���hC��!1e�:�$8�̭rq�,�j<x�A��9C����h�p�屋���ܥ�C�3�<��O�D&�"S{g�w�ɓ�Lt^��X�k6ͩ[5�����Qd�K��L<���z^v�$qJ��%}Y��}�IF��c�LL��ɦ �Ah.���Ʊbn���*\�q1�T ���!)Ћ7K�����L5��Ió#-g�3_���� 71�	-���܎�����E+�E<15y�]H�춍�ks+�"���jm'���b�@��8z8,d;���%�l�l��=f����	o�E�k��&�D��uu��P�($Ai�h�lJ߿����*.f���Ȃ-=���:��tM�JFR��tI�LP��:����7�r9�{��t�l½�є(���Gs8E����8^|YE�x���q"U�WA��Y��T����f����*`8@��M�"u�3_�HI�X�g�8,�Tt�G�O��AIܽh�+����`�U�u	���0�Nj��K���%�(Ù]Ѿ�Č�/��͏��\�_T:��`_0���:dt	Ejt�p�l9}�ˇ���	3h��\L�cZ �,í��"�m�uڿ0�����J���D����*�,̳��MJ���2I	Y�ikl�∰�h;��tk4�6R �4��kY�$�A�.�_�
�`�yJ��X	��K%�����LV;E�5���p�H-	>���*��< O����!q(��k^�Ӑ.��&�=��A��T�$*D�J4�;$�8�,,�q��3I��Q�ENz�˥���)ޘ��%}�� �E�8�=>&:�#yP�ŧ)�ς���'H���^�LA�=��YL�����Iϓ<�M�h,ta����$+�[5�M:7
xE�Al�:H�Ť�nt.Lh�	�,���$�!����(_������l[�V��hw�[�U^�:^��ЃG��&��h���mrI��-��R�SkQ�|$���%��˃�/.�\�ar��{ѳh.a� ��}N�K���/�]v�u��s�8�[��]�@��v�ő~d#AP�,B8[�{em^�Np���2�Ҝm�/X$�_1�����U8F1Q\-ɖ	�o[��e�\��@e�G�!��n2Zv�5Z�I}m���?��ZF�T,��r��KJT�����L�v�����kH;��D�zO�Z^\�d=8�1��KH��r������9}qIR�:Wg4����^y�r3o9�&^a@�4/]\��s뒞fYΎԆ�T�pZ�E�U�q�rR�8vR%Ra�I^E����~�ﺢ`q`H�Ě������)��E�=�L{J�KGH���� 	�h	Y���݈0�E��/�y3��p_k!݌���BCG�|}}��q�`jTRH��<"���$�������LKU�J�my�ŀsc�5�^W��%���ʙR����Vi�z]����d9U�e&�;�K�R�����K�Ni{]����s[Zk�5Ԩ�1g����N�BK�ص�:��Ʉs�篖��wY6^���&I�s���VI�XtI/ @r�=�慎�Š¦Su�uu1|v�)폽�!��VqO���� �V���Yh��BM� 2S;�Qb�=���*��E"�x������>L/��#����%�;�� Iw(.Q�G��m�:�*D���2�<��k���\ �Fs���-��gM���_�,��(&�e�s;j.��y	O��Eɫ��U-;�/�^�"M$+z�N�0����I�.6t�|W(��?ٜ��ה�1~���F��o�u�&�؜��Z�)��zq Š9�t)����Kn)�x׮.^j�v��$�2u�<_��~W���-L����.�{�u�G�հ���H�Ph�,[�A �8�d�zɭ��{�V�S�ka2��8x׵�.7�Iԋ7��q5
l�q/xr��y����E�W{����e��[�q$��B�%>��҈P�x��8�~�&5*��'>�g/��7���%6�y��b%�O�0�^W⺐�--}�	�ڨ��iIH���F}�r�푗(�UX1�j��2���L_E\��H��$Z5�n�ݰ`m�J�Gw�ЫB�ɚ�l��U��^m�h�p��hN�����-��m@�d"1ڥo�-��P\&)Qzhh�Þ7'+�Q^��Fm�n(�S²��1n%�2:�LJ��m?x9�e�&f)a3a�7��-�|>�+^ڋ+Ah^��:~#^Ҝ�K.k8���S��yA#I�+Ll"���DcQ���Cr-,saə��v�8�yM�	^��ᨕ��v�Qc���{����s��.��۷��'e~�{Uo�Ό�za���p�*&:��xO	^I)����x��l�Q��&�lr���(�<7�\f�(*(8��4�RR�D_�k�O�g�ES�Q����#�[+N{@�x4y���
�'��fR��\��NCT�� �S����|�;�m�$ٛ��LOQ؉b3m&�,�f�����\V�xT.k�߬n3S�/��nc�$�g\�l4�pZ�IMo����~��6����Y3	����e�!<��ڊk���eu�dg��2�&�-�K���~���}���~%�9ύh�c�Pgڅw^����{��Pa�&���{�1��;�x׊���"��L�\��6J?�K�.�<9�$� ����z�l?<��e'�dg�Z�Y{������E��i��@���U=P k1g=�&���L.�J.�ylej��&�I�� aF�=͇�X�o^k�!.>O����qݚ�����H�s�]�/P|1 �  ���x�KsQ侟}ؤe�k��$�9R.&��lmw<��wv����II����=�u�9�P��"M��3+Mr�V# b�^Z���6��er|����&*�7�9��eѷy�� �r�4ɩPڐ`�R�*�;�\_�
�N~���~C~����/�WaŜ�������qm�JO�X(
U�vm��0�H��L�Ɉ��	k��^�f^,���/$Yɥ�	��N}�,r�Nnt�tr��S^���Kq�bӖ����d>s������!��f9)������i��k��
��f�!���c�/���<"����e}��
ޟ�� 8��k�nڥ�N��<n�=���Ȧ��~\��l�D��8���	�_��b��o�F-?:�l��x���h��$���<GF��5gd��#x{����!���H��vqi�L��_m�}�d;8���N��`�w����D�N�U�����L&�3o^c}�be�y�T꯵�Z�/��Zˏ����Ǐ�R2�|         o  x�U�M��@�����A�H��k�ea!��ЋJ�`���>��h���?��W�����s�o?�jc}���/0+g8 hȑ� @1ѳ�{�њ@�QV!%F�E��±��	Q`;c��~N�7�lp%(��P�(���?��Rfم"Y���z����K
%c.�$RPR���y!O�h��˜�\PueS�X��������$q:�D�L�5��NӖ�h�y�
rbf���B�T��6���-.��Z^*D��k���OS?\.���މW����=��n��nw�kkub.���F)���ݟ���~8�� ̱]/�^[c�3��&�됺��s��!Zٿ��������Ri7D	D�W�7t]����             x��]]�e7}�����|��� !$�P@�����jg@��'�>��'�N6�(j/7�ı����!o��_�^��}�������w��7���|���7��n�>~�����7�5���R�f+��~a�}�������}_кύ���c~I}V��ڿo�?���Ri����[p��r ׬d�J_���c���Z7��?}�x�������tS�)k�õ��Z��]��+��;�T��.���߿||[�U �
�k��O>,l+ݷ�GZ*<�r�e����-���]]�/��>��l��l�����[�~��������|��Ͽ޾����6L!;H6�y�,�A��
�Hu�+w�R]˚f�P�l.l���v����g�c�kyhs�ds����6�է�?�����7�����w��w������\Wl7���f�p���S����j����cs����o߿�����\�!K=ߐ�,:�u����Թ���l��/��{X�+�'�_����ڌ���sk���[�1�)�- _�ݔ��V�P_�[�Wo����3�u�u��cks�7�~�n��?����Ï�Φp�!���(��v7����7=hL�v��H����V��HKA�s��`6��#8j��r����9� �9��{����:a��\؜kL����~�C-Kȸ���:w�,:�H2s9�~d���y�����so�������)�F���u�p��.>�^K�nA�F}���Jfcx%P��R�`-[3l#c���^B.��K�����*�������V��*��ѦF�������D7:�`�����X*�R�=�O���Ä,��yC��ňԂhp̤�m�o�����VHU�j0[�?��q�`�G�N��M\&̛����'TmΖ�Gg�l�T eE��_Pubxj���B(��I�/hwّ����wZ����9����i�4�2bwi&�x`�Ts^<��y�9�!}ࠥ+�@��c<�fa�FM#.3��|�vʉ�yv`�6j�����_�\oY�F"�g�J��}�"<v��8ݐÙsά?�����.�4�fb H��S �pF�q���X���R`w#��b�dZI8���Õ>�x�/+t�j� ���ɞ� ��Z�S��p7	��Ԍ`���>�~���t�sK2ӷd��%�#+t�1�%	o���	m�VL�t����\g��x�Ӧ�fN����W�ץ�c��X$V����	��z�8�c��T��.{�fS5�ؑ�c��YG>�jn:�ޞ�A-��Kxo� �gԆ|%QA��\�"%�^������sT�B�F>�gYG�5%Ĉs&��y����֢��ٖS��s�y��>ދw{�vJ�f�v��9�w�g��&�z]�^��m���d�r�H�.TKƬ#r�.��c�Uj��g�$�x)��B�p`�g;�`�+��SIh.��\�U�TT�h�te10�v}P< ��O�Ԫ�Gˀ�����W������!���i�1!�{�}P��.�T�<���4���gń�e/��55�w\�t�;�:�6���b{U�u���Z���Y1���R$�����J d
q�,D'(Tb��Yy�Y��9,='ݥBl�X�u�}h�\�p_B&��C�$� hm��6t�L�)<(�ͣ��Јou皋F�����B�e���l�����^�K��`)�-%#���qȌh!9-���@���\([P��bq�q��b:�]�GC8�0mhTB]�V.��IV25���k���z!PE�I�
*��<��Z�[���ʽ�����I5&|�-��xf��EC��qJ�4N��H�� 	M�U���<�҈Ψ��!�$V���u�X��\B�5EZ-����ېD��#喤<�����l$�*_`灊�H���hD3��=O��x��h�����? G�-�9RkrЧC���X��x�	m�ZB��kO��A޷B���Q�,_�RAp�dv`�#���t޳)�Z�O>9K��$Ԃ��Z!m�ۄ3�8S�ŹآG1�ʶ3nU�H��EΑg�~*g8ސ���P�9�D�t0%=��3��>Mef��)�x�Ӛ�#���d"1#&L���� �S��gd�T��w7�{�%�=/)�ed!ϵM"M��R<@ң�BEE���\��.1�ҨE�j�c���3l�������n�~ʑʜ�6x��;����5�VQ�Q�Iێ��q�o�����L�d�1O!�ポ/Y�#M���hS����m�t�P�h}+����}�u���93ј��"K<k�<�Y�#��5�m�D�6pDɄH�s�٣P�Glc����`,�P��`�"!���d�R�lJ#�.�U|�*�O�{��<�j�&�B�3RP2$�]�������HC��:9;�y&�:�#�x��$��8?�%�'9ӛ8R8�������H�资2���B�Y)����l?���hH����1����B��l��V�����,��<����K�h~�҈c8k��V�zR����a� Q������p�����_��B)�&��8���ĺ{{ZeF��(�*t������)]��(x*�������W.�H�E�sUHo,0�(�|1"�X��Bm��&�[���s�J�D&���R�C��+dbp�\��Swa�K1��Y.�b6r.o�������Ql6h3�Vվ���Z}�T;�Y	���B��wm,���	EM�I{f*4�K,c�T[(�';b.-5~���QE4hf!�s��iq"iq�h��z�Tm7���XD��]���B�{��@B<�f"J�#2��A�dj3�b\����ŵT;J���Z��52�-S<.��� ص��8:G��JM�LV/ڢ&W]_k�Z��+"�8H�����vԹ�_����{�&y�g��B�'r�c��'��DDjd`�'�WՋ���S�x.�%��>\J��ћ57uO��JڃL�3�j��WAU-�CA��xt5���fъ�E���Y4�4�F+�4�(��&z��"*̚xq������$��!�����`I��8n�ѳ��zqP�̎�����E�|��5휹,a��ٙ�t%S��ڹE
��Pa1�&�o�7�Oj�_,yF��g2M�-��ÀK��*��U�ɮ:�3dy},ď.tYTe\Y���[�E��QP$�
�P�C2Q�q�b�����;6�-M�&�sߥFhC�Z�ԍ�K����#�En�?��H�"I�(�x;,L�y �D���X��FqC1���"Gy�ˬP�	)moZ�Ռ6��L�Z˨ YQWR�å��0�.K%�]W�V`���0�����p3 ��
�Ҹ�29r���e뚻Q9��5M��l��j)E\�'����šF|��1i���z6Ga��Gl1���`�7�TD-#㚢��>�ډV�U`CڦZ9�'���"��*�klz�ħ�S8�0��;d#�y���dN���B��D�O��!4Mf1����;� ҧgƧ��I$k>7�iz�{=�.��5�J���Rx���B���/�<��z�]`�y28Cd��#��H��6�l�=�^N������tA��H!��
��O�r7l��:Ξ�a��z������nH�&3<Qi��L�B�DKtϒ�NV���{����B�
�S1�8�a�[Fm8�kQ����e>�W�|����F����?1���H5 �x�&#�
8���i��!xV���war�#xW`��ي�@2�I�p�*�;�	�����w�ecBRq�B��l�LU�ɤ5F{��T��GI��m !϶?]�E�D�=&�zJ�D(�zS�	EYי�t���8�d�FӠp��4��쇊D9f�}�D<�L�&Jy���$��ݱ���^l�шbK%8��Ɔ�b���G���{hk�2�M�h:`�B��5p!��}�깩Velj�d2ĉxi(^:6Hh�B�4�$�E��}�r������P��j���b{��ħ9��D�x��@�L٨5,w#�p�%�ǩ~���ԏ�Sv��lݱ��]ٛy   /28nvFొ�'>��/bX��.7@�d��OBQq0�P7g�/ٵ	�2���4��J{v@����e�-E'7�2�-j����)k�Ek��BR�4bj[]�:��X�Ŧi�bLY,������ds;V1���gq��D���4Sxq�4\��a��d�<�B 8��ۏ�=mAvqQ���ߴ3hj9�31�q?D#�Z��ʘ�R�GY��{B�M����`��F	��% ��xl�����)�����L�+͂��e��R����07�X(y\�5D����>~��z�6&�i1
rb~��~o�Y���h_����b'����@��;kd^�j�Trj��n�&$�N��Ѡ�{�,�=y�d�{��+���J����v*0���J���)�~�H{����!�T�z�c�S��'���<d��5�{����^��	Z�%�H�����L"��{-b4��¶4B�H%��o���¸t6�36:t���a��#uo�f��	J7t�MDV��+Y��Fh����g���s\(�y�D�4/)�z���Q�)+v��ӑM}"i��"���N�3N���; �C�L���U�SH����ׯ �.��5z��<hƬ�|�U�ƅ6�N���=�85K�$
zq�w�6�-�8�f���Q�YY�'d�B1+���J��C���{��yJ�J|Ó�Յ{���²�oI��$c���ً�	��.jY2X�	U�mv�߰ƭV�~�����~�E>���AI��E�Ɣ^T쀱D_��#yj�t	�'��G�z��B��)K|�m�'� u�GJ<�2�O��J��g��c�eA�x�(��9����6�����{��P��gة-�^�R�:_Ղ�?���^���x�>����� ��(r�*o�'^ƌ}N��N�(��SKQ��D���!�y��k��k�3OrkA��������&�drqPc�Ǌf^����` ��Bq��(�����m�դD1��������V�ki\��R�bt����R�q�Ɵ�L[c���&����>����"�         \  x�u�[o�8��G���x'�6[�]mh_����H�.�$�����EC�%0���9g�9}�Cz�}����4���x����O��U�1�Ir�+A?��z�O��Zy�BÙ��%�%���mHJ�<tK���^1P�#.����0����!�����q�a�gDW�~�c<�\����%j�q��`�>$�x���q!��3�����K߅L�!��)n!��u!}~��i�X?�p*|U�y��{��?S�1�.c�-�������xCw��	�0��R����L��t�Ʃ? �}�mQ{ɴ�^Aw��erl;@ǹ`,�9e$���4�i�7�#�<�F4y� d��R7S[�s$��Ϝ0��V@�o��0m9�Y�%@�2&3Y~{+�h��F1}E컒p+�P/�2L�̨�;���ހH�S?��0)���3eV��d2�n�L�1��n,0�53ٿ��*��׈�Gz��l��Hǜ�h�Y���O�!�ve_�1��c~�������Hم�
��+�i�J`���0�Xv˾�e_�r�_��R�y��a���3s��v4�|M޶�P/52��3�X���{����d�����t��JoE�{:T������?�c�).��y��]O�ÿ4ԏ�n#]��e�$R�'��[��4�b�8.Vb_�Wg�_�ꀌ��s>p�d�UR����6�ő��W+$�[����EW6�H�|��8(����k҆2"ap&p�/�>��J��n,���)g�U&[+�=c�4�ڨ�8p��m���O6����R,/d�pV��'������k��1�ó��ts���'�r��s���9?��=�rk���yHR�R�O]U�[�K&     