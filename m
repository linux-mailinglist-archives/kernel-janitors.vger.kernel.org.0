Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783B77CA546
	for <lists+kernel-janitors@lfdr.de>; Mon, 16 Oct 2023 12:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjJPKZ5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 16 Oct 2023 06:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjJPKZ4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Oct 2023 06:25:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6A0B4;
        Mon, 16 Oct 2023 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697451954; x=1728987954;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0JfWSs8gWk8qKnQyzlErOKHgUA8os+7IttDIvNRSJGI=;
  b=jAVowuGyBO8f/+oT10LQC5vomrm8kt4B9O8fF4/bxP2WjcLcE1zFdd0C
   DM3KthleNeTCoC/8k+LExmz/J7XzKmhV5NY6GHsbv28MLXVNH5Wsigp01
   QH1PD2rckaPcizEqb/txiNXgl12gUIgH+MomOMuqYWWPowg0gRDPL5mGe
   dy5A1tcp5wlKOrO8nOYId3brNo1mBJS48turoh9hgLbPjUnxawAIUxgj1
   GXNvLjXN7iBM+5118Z2b1u1V4MMMUu9n1aUn3BhztxbhtlNTUw19ccW1h
   y3cFRmFS6dU0AOlAfbwasYeV7TbfQp6NWCscf35C9yJsACzmMH3Obuybb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384366143"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="384366143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 03:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879388863"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="879388863"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2023 03:25:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 03:25:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 03:25:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 03:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGYDkndd69fPDKA4ykw7n91Za3099y4fhspv67MWFYgXML0Sa8hJ3A8NxFssoEvRXULqaDYBoZ+2FFn4PiSzb2dW6IksprdzAspnQjJHKXRTx7ziiU006ByIQbrZ7RH1bMVzQD0xiXLyhzdjU0EMChxk0TR8CPOOk7fp5EM75j3F8l4lnKFX4jAdeg+SNeB3zCJbo2/a/Pzep7PgXfnP5HspVXZGpqgQNcOD6LVWcD/aXSqpoFAvrjDdY9Z2u5lygsjkTJ0c4i0qP9/LwTzTHla83SYLcAuUCKvsHW8Q0jGLdXe0A9A1BxlBIeraADGlEoP8FPCizOLeLr9VpWozqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKuoacI+2rYmtTSpbi2CvkMPwkNGolJU4c+3UFDsaII=;
 b=PRIlP1O6sRRT2Y7F5pXNeVC1ZUxCFzpBq2L81P98KbeBhj6hJaYR4mQSZ25Lsb23NkhrbGF4eMrJEE8LNkLlekHvtymMiCB9Qd6UX2ear18374X01urs0hmE0ZLRZlzkRIWDywQjfahQP8QZg2gBrho94pWfQuVEyNAho+wY+0ooFNYCBbaQEnFrk8ShXyOn4V0rJ5Zwjk4P658zWOse7QCVqwiF1tQZbMGIxamB/J8/LTRj8DOx6NuDPkIRNniYGgXckOjGYxn9DxxFBAMZW/1w9Bs/9J2uBtpHBvIPfwa1qRR4twcX0nupWRI7CNLnhLTsAxlRHa1f3RupJo/45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB3521.namprd11.prod.outlook.com (2603:10b6:208:7b::32)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 10:25:44 +0000
Received: from BL0PR11MB3521.namprd11.prod.outlook.com
 ([fe80::a2bc:136a:3f41:c858]) by BL0PR11MB3521.namprd11.prod.outlook.com
 ([fe80::a2bc:136a:3f41:c858%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:25:44 +0000
From:   "Romanowski, Rafal" <rafal.romanowski@intel.com>
To:     "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Eric Dumazet" <edumazet@google.com>,
        "Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
        Simon Horman <horms@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: RE: [Intel-wired-lan] [PATCH net-next 2/2] ixgbe: fix end of loop
 test in ixgbe_set_vf_macvlan()
Thread-Topic: [Intel-wired-lan] [PATCH net-next 2/2] ixgbe: fix end of loop
 test in ixgbe_set_vf_macvlan()
Thread-Index: AQHZ95QKnEZtA986pEau8lAwfRecsbBBmI6AgAqucrA=
Date:   Mon, 16 Oct 2023 10:25:44 +0000
Message-ID: <BL0PR11MB35213542185A8B83435E82328FD7A@BL0PR11MB3521.namprd11.prod.outlook.com>
References: <34603f41-1d51-48df-9bca-a28fd5b27a53@moroto.mountain>
 <45de79fd-5763-bb55-22b2-0bfd64873c4f@intel.com>
In-Reply-To: <45de79fd-5763-bb55-22b2-0bfd64873c4f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3521:EE_|SA3PR11MB7526:EE_
x-ms-office365-filtering-correlation-id: eba34ff2-a14c-4239-c0d2-08dbce32416f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C/U6VZPgM5Xmm1yR+sO+UTlbHyc2QMOcKCTCIGJNL2S/u4Gcjr93nNt6VaHcZeSrscRBf/TKFeIrKcva7LMNMGPHjx1Jz/yVINMv2Hv4y6NtFr1D+PX/ZOvvMmI+uRywYWrj0ERkSJ5+mi9vl1nv9+sU+OBox6722us/YaHWUYbeVGsC7uKwP+N1XZcbr/CrifJyyYwMjUm7WbqhXWhkXTg2w/CNrWCTM+wMGpxqts7s1uwcWg95xaIXn6zfA78ixh/oxnt5tg3oMNANInGXNV6ykjeBDhsvjN+qOygtaOGJyYfIDo1C+Zr+BsbhdNuPvj0XtgY16UaDYhZy0TA/0ipnGUf+35F8uPMrIFYk4e9QXh8zsMd8XWecBVumbOauZ+riCFSLuu22Z1Rb+88Mnv9JgpDE2ioyFv+yYXNiNO4xO6OE3SkzQiswR0b3u/f/8l2oNxEyVVCg23ULS5I9A5EhC9Iom/O03siSR1V8IXI347SjvDpc6VuXbTe1NLD/Wx84Okxue2UlRjW5FSwQrnr26tET8Ev8y8l/2eiUDaOvJK7EBcUiR9EjBz6YTTXBxwuUh9W/bucnGB6LNoCrhn74ZEj7hgzeAmGn2oFKupw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3521.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(478600001)(966005)(110136005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(71200400001)(82960400001)(83380400001)(86362001)(38100700002)(9686003)(26005)(53546011)(7696005)(6506007)(33656002)(41300700001)(5660300002)(38070700005)(122000001)(8936002)(8676002)(4326008)(7416002)(2906002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ekkj+sfje2woH6GSqgZkN61YLKaf5/KPnwe4PZ5uVF/24+Wq9e7JrfTJKHVa?=
 =?us-ascii?Q?L99TAKPfcAQevNIfjJph/55YadAWWIl7JBCC4Qq0sFgNyNR+orfsogjPT3T3?=
 =?us-ascii?Q?mE010I4pNqe33TZKx9gvXR+zMmh2a+Rd7oTtY3x3WFHcHaIDpxlruJnTkuXu?=
 =?us-ascii?Q?+tV7d3qezrjgjfQVj4R+5XRCe09njMz4dxu+v/nxTxD8z0EDHEZIwJYwSqSk?=
 =?us-ascii?Q?SH/NTeNSk/e9lXI4pYO0wLI6XV35J6bsD492rcnNbDgSargKw6cDDlC0l4O1?=
 =?us-ascii?Q?Ak3heuqmzf3lIeDonPX2y+lGv3WenK2Pto19LCyoCpXAd/2uj+KfH2wW0loy?=
 =?us-ascii?Q?jlmoddzf2cdl3ssQAF4dM0TMI5umTknf+TBxH6u9neX656xSbgQPJNcdbcB1?=
 =?us-ascii?Q?ndOTqDl9pA4oGWwNNnvEXxJU9sOLbXjUQjfEZRlI53xg0DTHnwaRHZBAT0v0?=
 =?us-ascii?Q?+mehx2O3kTp89OZBl8kgxBdi6yRxtgdJYAgXHYIzooFQAIcaa0fhU+sHPsH4?=
 =?us-ascii?Q?ITZHbPnPV7BLWjb0nfKpvEKsvqxuUjr0ewH4wrFxwW5+picJi6NQCqwa+TA8?=
 =?us-ascii?Q?9rrOBNdriCJdiSuNAR/RYscz/FwQ3oYHpMX7d9S6me7i+m/Y1lgj7Yr1dDzx?=
 =?us-ascii?Q?/5yQU6V+SzN+cvVS4wYY72esd7fyODTYmqGR6bTxo2q98wGFRyjbDcyl3uzK?=
 =?us-ascii?Q?pcsl2xyOwt53xqQXcq3q/04JyK55ZntzHb3zXpOjRS8ep02/NQ5m3nN5baUW?=
 =?us-ascii?Q?amXtMhbT4MQeav6haurpYbnOtmvJ6P1ebCOxsXltowWomBl83b4MEMCsfJNf?=
 =?us-ascii?Q?yG48llN5MaXXaqhQ5obaZ/CreO/HRr4Yt49uMdU8NTu1O9m1NzSJQDbBcGSi?=
 =?us-ascii?Q?rr4sh0OUo/WwktHhpSD8ASPRKtQohbpCMeMwxBixbe37t9Sc/mZPvGCfPwTK?=
 =?us-ascii?Q?s4zXTf9YsSYKyFJXKfCZ3NRGA2y3wsd81RSqU5g8O16y5xSUCKLIfo6eSzxp?=
 =?us-ascii?Q?h25U1FKmAJ8fRBYXNnwX8b8L4dW+UMXhl15OBecto+XJQal8a4AouNQelUqL?=
 =?us-ascii?Q?7U7ix+GDvx1p69QvoyfrFEQOYJHA1N2B6l7PIUuheqfte6M5mxQWLOBUL7hL?=
 =?us-ascii?Q?psPaHUiHW7y06zAARgbD9mR3lQLF1V+I4MMWPMZv7j6s2RDReWpzy/1ckvXY?=
 =?us-ascii?Q?XSGVOBYNUennBUSKPt15imKO5TBA3hQyorGscRCU4JQVVyX5xJS+zUqHeukf?=
 =?us-ascii?Q?YM7Vo+OFZ6vag200UKYW5MfUrE3rLuCGtBF2YRz953HKksAtEO6M2a93Ab62?=
 =?us-ascii?Q?v7ID+CwPFjJbjmargAfLp1ZxzqeiqfJl5bskzj4nrLYubyABLriBF1MzpoTF?=
 =?us-ascii?Q?Td1IQhVWueX+fNGnqObNHsbkcS5qWBbHp3rNEA5HGxloZE42Lei2nQIJiiRu?=
 =?us-ascii?Q?mm+OeWlVKZP8FxPeqRnmRTbbaeC+Xts9UmIhuRH/Pq59yCOx1voONmuPwHop?=
 =?us-ascii?Q?bvlrVZmwwM3aAx3401tSAE+M8y//S9S9HjKT8FUVWwyeSdhrcQS/uvSGtT3I?=
 =?us-ascii?Q?X5OpDh7g9ZYCzw5oj7gOMFoQOzCN6BhfSNsVjhOzCURSFwxT3MORO7BgJMyJ?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3521.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba34ff2-a14c-4239-c0d2-08dbce32416f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 10:25:44.4517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgB/KiXIivQBuAqvsTQmoT2NVsXgnrDkch8OQccxl+XEkJjnii/G13Ev3JhU6OzgaoQZOd8qtSZ+Q6gyC89d8UNKom+8gQ/fFF0KMH3U/9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
> Jesse Brandeburg
> Sent: Monday, October 9, 2023 5:18 PM
> To: Dan Carpenter <dan.carpenter@linaro.org>; Jinjie Ruan
> <ruanjinjie@huawei.com>
> Cc: netdev@vger.kernel.org; kernel-janitors@vger.kernel.org; Eric Dumazet
> <edumazet@google.com>; Nguyen, Anthony L
> <anthony.l.nguyen@intel.com>; Simon Horman <horms@kernel.org>; Jakub
> Kicinski <kuba@kernel.org>; Keller, Jacob E <jacob.e.keller@intel.com>; i=
ntel-
> wired-lan@lists.osuosl.org; Paolo Abeni <pabeni@redhat.com>; David S.
> Miller <davem@davemloft.net>
> Subject: Re: [Intel-wired-lan] [PATCH net-next 2/2] ixgbe: fix end of loo=
p test
> in ixgbe_set_vf_macvlan()
>=20
> On 10/5/2023 6:58 AM, Dan Carpenter wrote:
> > The list iterator in a list_for_each_entry() loop can never be NULL.
> > If the loop exits without hitting a break then the iterator points to
> > an offset off the list head and dereferencing it is an out of bounds
> > access.
> >
> > Before we transitioned to using list_for_each_entry() loops, then it
> > was possible for "entry" to be NULL and the comments mention this.  I
> > have updated the comments to match the new code.
> >
> > Fixes: c1fec890458a ("ethernet/intel: Use list_for_each_entry()
> > helper")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>=20
> Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
>=20
>=20
> _______________________________________________
> Intel-wired-lan mailing list
> Intel-wired-lan@osuosl.org
> https://lists.osuosl.org/mailman/listinfo/intel-wired-lan


Tested-by: Rafal Romanowski <rafal.romanowski@intel.com>



