Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA5378546A
	for <lists+kernel-janitors@lfdr.de>; Wed, 23 Aug 2023 11:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbjHWJje (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 23 Aug 2023 05:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbjHWJip (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Aug 2023 05:38:45 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65C8618C;
        Wed, 23 Aug 2023 02:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPTDlhffazl74C7E9cutywDnj0AwOwAM+h2lrizoiTPPWH2l/DPzG0UgU2g7T2ouhfmRH8uUorDgYqaPzStJtUKEMvr0m+ZdLvtGTBeQbMcSaXqfhhHoqDq8IVd6mdfZ7ZzT5VqXX9sS/ubmveORtNxMlxTC7Jy2ul/YMqVUNcRK54FI72tt4K5n0SW6bnlZaygQmS5Jkz/RbqRl9S8sYI2YJPIq/n8bD5Qks9JxUMoh8xODqWjKgKale5bPRQRu0SkfMsiZquRJyEuK7YvKdNSX/0TJ6JpgW6rDDI575D87bM8RSTSY+VPoYHg4CoPwve8dmoWSVC7Li8Avw1EJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n42XG+umGOaV9dBGyPclV+QNf/FYiPke/WVK3PZjkIo=;
 b=Txb4nOMD/Y0cUleyyH5d3xpvn11LgGimyKNwpw7Az7oPdkiPJdcWPGhrpIHdQzBihq/m8YcQrlnxO/0G1+Jwh+jBbG6NVTZfjkdlUl64IneoJs8IuVuU4aqXR2txovcbWwfhBWsgNoz8qFhAlL1lU/keo/OuI/hGy2i57Yg29WU/5U/PHGcQJqdVMWn5bvixCemWuo0RbYbywm42QrPbiGgrYC1C7VMQsmDWup9w0rGOxggWky4tfEPCgqFPM9hI0tqXEAy7UvKqUDSA2lGEhAU8GID2R5vYVLEEzMRtmRjclAN5/N74MEm3XB9spbb7YIkT6fcc4ud7eB2mmXxNSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n42XG+umGOaV9dBGyPclV+QNf/FYiPke/WVK3PZjkIo=;
 b=IajgxWaOh3neMQsYcCgTa8ptheADBkwovyrR6UImoRUr8CWTb3hBbRLg8wJwCwfiwczZV+ID8P8Aj9nYuIbPOT/lYJJ7Y5EclTpEsH0adTYzLQgIhsNJ5SRSy5gW01mqrGYR3Hj9SVyQLHpTuB9njHVHdcyp7iuSGXxBi5RZfjY=
Received: from PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21)
 by MN0PR12MB5764.namprd12.prod.outlook.com (2603:10b6:208:377::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 09:31:12 +0000
Received: from PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::ffd8:4c61:6807:9ec4]) by PH7PR12MB5997.namprd12.prod.outlook.com
 ([fe80::ffd8:4c61:6807:9ec4%7]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 09:31:12 +0000
From:   "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To:     Colin Ian King <colin.i.king@gmail.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "Lazar, Lijo" <Lijo.Lazar@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] drm/amd: Fix spelling mistake "throtting" ->
 "throttling"
Thread-Topic: [PATCH][next] drm/amd: Fix spelling mistake "throtting" ->
 "throttling"
Thread-Index: AQHZ1aCzvxq4EhJGWUKCa5TIEkpLLK/3nW8A
Date:   Wed, 23 Aug 2023 09:31:12 +0000
Message-ID: <PH7PR12MB599765C42139EDFCA7080339821CA@PH7PR12MB5997.namprd12.prod.outlook.com>
References: <20230823090323.184121-1-colin.i.king@gmail.com>
In-Reply-To: <20230823090323.184121-1-colin.i.king@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ff914cdc-14e0-4f7b-af62-398b6e62953f;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-08-23T09:29:41Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5997:EE_|MN0PR12MB5764:EE_
x-ms-office365-filtering-correlation-id: 4b3afa58-fb60-44ff-e650-08dba3bbb0b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yXPXm49R/4MgSzQzEK6WKfDUK0VB/nCF6U2at2RXrz4qtIQ54RsKl9gM9CGd9btaXfOf77Ccb3qRcvba1/56OkmQxfImq10QBE+B6T7xmFTzkJnUQQ0s6O3SdsAGfM2oy0wowoJ+436n5bYHJUzYhQp3rbejMEbeIS4THl7lJRBEseN4OTnBXvaKmJ9MpU/Vwcm1drcI66UhsxZNCLy8y+3H8H1QjRqu0lqbfZR8HGZ8nVPx5Nqmed9caWdF26SZPppVeOtKYseE+HB12KJSXlqBBAnJjER3kLNt8Hw/f5EJqtrxoFS+3aNmVL8hns1ZFKD4GlF8nK77tpny+v6TdjjientLzTgND5Wbm3mPFwtzKqgIUROcj6Et658X+jx5un/4kxEkHIrK8dL5im5BsS59POjjulgP/X2xGQNc9nf7Yz0Yq0tCXOojjty+Nop+ii/HyCEWjtoP5+KlPl6GozMxmXiC2ehvcpgY/ZJKxvhkt/pAFG7GoJPh2GmmNjI4K740WmFAvWUsRr5m+TFuiARLx0r7kzvwz9uacx0zQyanv0aZlM7sqUS49AEETMAeZ9FXuRTFx4OT3sqevKKTqq/KrVYavBXK1MfmcC10cG0FRoiO8Ba1SExyGp1qsZXG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(186009)(451199024)(1800799009)(66946007)(66446008)(64756008)(66556008)(66476007)(54906003)(76116006)(8676002)(4326008)(8936002)(53546011)(7696005)(71200400001)(6506007)(26005)(52536014)(478600001)(110136005)(41300700001)(316002)(9686003)(5660300002)(83380400001)(2906002)(33656002)(86362001)(55016003)(38100700002)(122000001)(921005)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEN2ZjlxSUtwT1JoUVIrOGczZmJaZk5wdE1ZN3NsSjVJeVZZVG14bXpBdzhZ?=
 =?utf-8?B?SituN1hqbCtFN1NJWGJocE8vMVRlaHd0VVNuZzVaS09CTDdpWFVacmh4dFVk?=
 =?utf-8?B?RCtJZUJpSzVlb21pT3Vza0JIMVdMUlZVZU1aajJHalhjSzdmOXh1WEJuTXVE?=
 =?utf-8?B?UXVCbldxd09talloY2dWZ1Y3cU9CTDY2VnA5dkZsdmJjall2Y0hlNzFEMGs4?=
 =?utf-8?B?OWdpVVNobnhZVy9kVTlkaUlJQ2luY1RLbUJjMVFrZUhHNStSOUlIWlZNejY1?=
 =?utf-8?B?VXp3Qlo4T1g5KzkxZjRhRGZSRUlNSm91TjRwRkdpbnJ0THhBNnRmUVpFT0xn?=
 =?utf-8?B?UEkwSmtHR2hLN1puaHBXeWxGU0pOSUlQbmtMZkpsa3Y3a2lwcFl5aEZWQTJu?=
 =?utf-8?B?d0YwWGMwMGw3bC8rWDFQalZRN0V6bkpqd1QrYlZncnNqY1ppOWcwdkFZa0hJ?=
 =?utf-8?B?cXBlSmRLTUlISFFnTW1WZHh6SG9WTHZlRFJIS0ttNWNQbHYwb3V0cmRpTVJF?=
 =?utf-8?B?Q1hsekZ3c3dVR1NnVk9XcG4vaTZPVTJ5S1dVcHFtUUEzaTRZNEJ5S0xnRVRN?=
 =?utf-8?B?LzFickI4NzBWd0pQYVRtQ1J4RE91bXl4VkZNZVppVEtRV1JpT05WNG41VFNZ?=
 =?utf-8?B?cVRKdFA5dkhFTXVoSDRaNkJDSlIyQWxkb3dlRWlnOHhlTWdRa2RyVDRVTysr?=
 =?utf-8?B?ZmtLNmJSVTlsLzBiOGhXTXFiK2ZJc2V4L0M1cktWMWExK2lTUndvMkxxWGFl?=
 =?utf-8?B?SUx0MnhNQmU3dFZFYkZoc0lWcGEySVJHb09nSVJpeWlER0w3Mmx0MFZIMGlW?=
 =?utf-8?B?RFFrRDhpWExUZzZXRHlOdGU4RDBsYVhxR3c5QzM4eGFlek0rd2dIWlNham0r?=
 =?utf-8?B?cTZ5U2hNdFptV1Z1b0p4Q3drYTVrNlZueWxSd3k2Vk1SM1NSYXhnc0g2bm12?=
 =?utf-8?B?dnhKVEp4Wk00alhTRkpHQ094TXlpYTFtZUdsVUFGeU9UdTRERFY1UWgwUFdn?=
 =?utf-8?B?RkdqeGUwRmJzaHRpblY1cVp2WW9JZFViQjlONzB6VXMvVzNBWjZHTmJyRjFr?=
 =?utf-8?B?a2xabWRoZzNHbFhxOHk5ZThZL1hMOXQza3gzTHFxTkQ5RXJVY1ZBQXp0ZTdi?=
 =?utf-8?B?WFkzTjJlRnlrSFYzaS9kQlFwd0ZwUXZKZm04dng1T09xOGFIaDVFWDdEb3Ns?=
 =?utf-8?B?VC9hKzBJWWR0cXVwNTRBKzltRmh1KzlaOThTWjBLVWxYcDFzTmVFZFdCQ2Za?=
 =?utf-8?B?V04vU282Q0wxdDJmTXV6cjV4S3VwNTkzVEhyd0ZET1J1am5DTGNDS0ZqQ3JD?=
 =?utf-8?B?bG5FY0YxS0pjYmU1ZFFSUHFlVEJxM1p4WERxeXBjZTNPcnF3Z2NvditXYnUy?=
 =?utf-8?B?T0k2SnlVN3hxODZySTRUQzFVQ2Vrd01nTThnMllGWXlXVjc4TzV2bWd4c2Jh?=
 =?utf-8?B?VUZoUFE4K3MxdzA4dy8zSWJ0WVMwT1BMSVAxUTZpWi9NWGtKdXJZelYzaTBC?=
 =?utf-8?B?d2UwMWxmUmJJWEhzUXdRdEtVRnB6emtISjlFUXdyVFBWQm5wSWw4WVhJd2lj?=
 =?utf-8?B?ZlRrOGtEcFJSY25HUDd6aklxQ1hsWEljRWNhajdJZWNwdFVoWEZoTTZmV2o5?=
 =?utf-8?B?U0VkYUpQTWl4QlFTY2VhSXRwbUlOQmJFR3d1a3JXelB2Vm43dXZsWkxnR0Fq?=
 =?utf-8?B?Q2pmSGszVzdLY2xiOEdZRXJhQzROeEtQenpMWEhocEo5bFBSS0VjTGY2dDRw?=
 =?utf-8?B?M1J3UHp2bDhoSlVrVzlpMFoySHNWaW1LT0EzZm9wTnFpU2hoWmZSY2htUE9h?=
 =?utf-8?B?eGZsS0xUeTVlaFVGNDJHejQzVlA3OHZKN09VZlRHS1F4cHI0c0lYeURmZWNr?=
 =?utf-8?B?dHdUSGd5YWJpcERyNFBpT25ZWEM4VlpOeUg4a29uTkdxVXd0UkJHOFQ4SnIv?=
 =?utf-8?B?M1p1UHBiMHVRNnNVckJHUmZheUo5R3IybEpRb0g0TzdjTWlTR2tmeFRmZkg2?=
 =?utf-8?B?eS8wR3BtakE4Z2lrQVdGdWJmZDN0Z3dMQnpBMnRlNFFwS2lMOXY3UVdMdzIy?=
 =?utf-8?B?VGpIM0VSRGZibWlWL25rb2xGSDh0OGd2NnR1cHlQRlpOYTV3ZmVubkpqV2Zx?=
 =?utf-8?Q?dbnk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3afa58-fb60-44ff-e650-08dba3bbb0b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 09:31:12.1443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VlxS7FIWtt/+eKSMTw9OKvpAiYA+44spn9QqB+IyYeRZEZuunJolIfChvUedd9FP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5764
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClJldmlld2VkLWJ5OiBZYW5nIFdh
bmcgPGtldmlueWFuZy53YW5nQGFtZC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCktldmluDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIENvbGluIElhbiBLaW5nDQpT
ZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMywgMjAyMyA1OjAzIFBNDQpUbzogRGV1Y2hlciwgQWxl
eGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+
OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPjsgTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzog
a2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZw0KU3ViamVjdDogW1BBVENIXVtuZXh0XSBkcm0vYW1kOiBGaXggc3BlbGxpbmcgbWlzdGFr
ZSAidGhyb3R0aW5nIiAtPiAidGhyb3R0bGluZyINCg0KVGhlcmUgaXMgYSBzcGVsbGluZyBtaXN0
YWtlIGluIHZhcmlhYmxlIHRocm90dGluZ19ldmVudHMsIHJlbmFtZSBpdCB0byB0aHJvdHRsaW5n
X2V2ZW50cy4NCg0KU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0Bn
bWFpbC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL2FyY3R1
cnVzX3BwdC5jICAgIHwgNiArKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3Nt
dTEzL2FsZGViYXJhbl9wcHQuYyAgIHwgNiArKystLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L3N3c211L3NtdTEzL3NtdV92MTNfMF82X3BwdC5jIHwgNiArKystLS0NCiAzIGZpbGVzIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvYXJjdHVydXNfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3N3c211L3NtdTExL2FyY3R1cnVzX3BwdC5jDQppbmRleCA3MDRhMmI1Nzdh
MGUuLmZiY2ZmMTU0YjFkMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTEvYXJjdHVydXNfcHB0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTEvYXJjdHVydXNfcHB0LmMNCkBAIC0yMzEzLDcgKzIzMTMsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHRocm90dGxpbmdfbG9nZ2luZ19sYWJlbCB7ICBzdGF0aWMgdm9pZCBhcmN0dXJ1
c19sb2dfdGhlcm1hbF90aHJvdHRsaW5nX2V2ZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211KSAg
ew0KICAgICAgICBpbnQgcmV0Ow0KLSAgICAgICBpbnQgdGhyb3R0bGVyX2lkeCwgdGhyb3R0aW5n
X2V2ZW50cyA9IDAsIGJ1Zl9pZHggPSAwOw0KKyAgICAgICBpbnQgdGhyb3R0bGVyX2lkeCwgdGhy
b3R0bGluZ19ldmVudHMgPSAwLCBidWZfaWR4ID0gMDsNCiAgICAgICAgc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7DQogICAgICAgIHVpbnQzMl90IHRocm90dGxlcl9zdGF0
dXM7DQogICAgICAgIGNoYXIgbG9nX2J1ZlsyNTZdOw0KQEAgLTIzMjgsMTEgKzIzMjgsMTEgQEAg
c3RhdGljIHZvaWQgYXJjdHVydXNfbG9nX3RoZXJtYWxfdGhyb3R0bGluZ19ldmVudChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSkNCiAgICAgICAgZm9yICh0aHJvdHRsZXJfaWR4ID0gMDsgdGhyb3R0
bGVyX2lkeCA8IEFSUkFZX1NJWkUobG9nZ2luZ19sYWJlbCk7DQogICAgICAgICAgICAgdGhyb3R0
bGVyX2lkeCsrKSB7DQogICAgICAgICAgICAgICAgaWYgKHRocm90dGxlcl9zdGF0dXMgJiBsb2dn
aW5nX2xhYmVsW3Rocm90dGxlcl9pZHhdLmZlYXR1cmVfbWFzaykgew0KLSAgICAgICAgICAgICAg
ICAgICAgICAgdGhyb3R0aW5nX2V2ZW50cysrOw0KKyAgICAgICAgICAgICAgICAgICAgICAgdGhy
b3R0bGluZ19ldmVudHMrKzsNCiAgICAgICAgICAgICAgICAgICAgICAgIGJ1Zl9pZHggKz0gc25w
cmludGYobG9nX2J1ZiArIGJ1Zl9pZHgsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVvZihsb2dfYnVmKSAtIGJ1Zl9pZHgsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyVzIiwNCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdGhyb3R0aW5nX2V2ZW50cyA+IDEgPyAiIGFuZCAiIDog
IiIsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRocm90dGxp
bmdfZXZlbnRzID4gMSA/ICIgYW5kICIgOiAiIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbG9nZ2luZ19sYWJlbFt0aHJvdHRsZXJfaWR4XS5sYWJlbCk7DQog
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoYnVmX2lkeCA+PSBzaXplb2YobG9nX2J1ZikpIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihhZGV2LT5kZXYsICJidWZm
ZXIgb3ZlcmZsb3chXG4iKTsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTMvYWxkZWJhcmFuX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9z
bXUxMy9hbGRlYmFyYW5fcHB0LmMNCmluZGV4IGNjMzE2OTQwMGM5Yi4uYmVkNWE5ZGYxYzA2IDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9hbGRlYmFyYW5f
cHB0LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMvYWxkZWJhcmFu
X3BwdC5jDQpAQCAtMTY3NCw3ICsxNjc0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0aHJvdHRs
aW5nX2xvZ2dpbmdfbGFiZWwgeyAgc3RhdGljIHZvaWQgYWxkZWJhcmFuX2xvZ190aGVybWFsX3Ro
cm90dGxpbmdfZXZlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQogICAgICAgIGludCBy
ZXQ7DQotICAgICAgIGludCB0aHJvdHRsZXJfaWR4LCB0aHJvdHRpbmdfZXZlbnRzID0gMCwgYnVm
X2lkeCA9IDA7DQorICAgICAgIGludCB0aHJvdHRsZXJfaWR4LCB0aHJvdHRsaW5nX2V2ZW50cyA9
IDAsIGJ1Zl9pZHggPSAwOw0KICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNt
dS0+YWRldjsNCiAgICAgICAgdWludDMyX3QgdGhyb3R0bGVyX3N0YXR1czsNCiAgICAgICAgY2hh
ciBsb2dfYnVmWzI1Nl07DQpAQCAtMTY4OSwxMSArMTY4OSwxMSBAQCBzdGF0aWMgdm9pZCBhbGRl
YmFyYW5fbG9nX3RoZXJtYWxfdGhyb3R0bGluZ19ldmVudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSkNCiAgICAgICAgZm9yICh0aHJvdHRsZXJfaWR4ID0gMDsgdGhyb3R0bGVyX2lkeCA8IEFSUkFZ
X1NJWkUobG9nZ2luZ19sYWJlbCk7DQogICAgICAgICAgICAgdGhyb3R0bGVyX2lkeCsrKSB7DQog
ICAgICAgICAgICAgICAgaWYgKHRocm90dGxlcl9zdGF0dXMgJiBsb2dnaW5nX2xhYmVsW3Rocm90
dGxlcl9pZHhdLmZlYXR1cmVfbWFzaykgew0KLSAgICAgICAgICAgICAgICAgICAgICAgdGhyb3R0
aW5nX2V2ZW50cysrOw0KKyAgICAgICAgICAgICAgICAgICAgICAgdGhyb3R0bGluZ19ldmVudHMr
KzsNCiAgICAgICAgICAgICAgICAgICAgICAgIGJ1Zl9pZHggKz0gc25wcmludGYobG9nX2J1ZiAr
IGJ1Zl9pZHgsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNp
emVvZihsb2dfYnVmKSAtIGJ1Zl9pZHgsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICIlcyVzIiwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdGhyb3R0aW5nX2V2ZW50cyA+IDEgPyAiIGFuZCAiIDogIiIsDQorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRocm90dGxpbmdfZXZlbnRzID4gMSA/
ICIgYW5kICIgOiAiIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbG9nZ2luZ19sYWJlbFt0aHJvdHRsZXJfaWR4XS5sYWJlbCk7DQogICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoYnVmX2lkeCA+PSBzaXplb2YobG9nX2J1ZikpIHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZGV2X2VycihhZGV2LT5kZXYsICJidWZmZXIgb3ZlcmZsb3chXG4i
KTsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMvc211X3Yx
M18wXzZfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL3NtdV92MTNf
MF82X3BwdC5jDQppbmRleCBkM2I1NzhlNmJjMmEuLmZhNGFkMDgwOTllZiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMvc211X3YxM18wXzZfcHB0LmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTMvc211X3YxM18wXzZfcHB0LmMN
CkBAIC0xODg4LDcgKzE4ODgsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgdGhyb3R0bGlu
Z19sb2dnaW5nX2xhYmVsW10gPSB7DQoNCiBzdGF0aWMgdm9pZCBzbXVfdjEzXzBfNl9sb2dfdGhl
cm1hbF90aHJvdHRsaW5nX2V2ZW50KHN0cnVjdCBzbXVfY29udGV4dCAqc211KSAgew0KLSAgICAg
ICBpbnQgdGhyb3R0bGVyX2lkeCwgdGhyb3R0aW5nX2V2ZW50cyA9IDAsIGJ1Zl9pZHggPSAwOw0K
KyAgICAgICBpbnQgdGhyb3R0bGVyX2lkeCwgdGhyb3R0bGluZ19ldmVudHMgPSAwLCBidWZfaWR4
ID0gMDsNCiAgICAgICAgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7DQog
ICAgICAgIHVpbnQzMl90IHRocm90dGxlcl9zdGF0dXM7DQogICAgICAgIGNoYXIgbG9nX2J1Zlsy
NTZdOw0KQEAgLTE5MDIsMTAgKzE5MDIsMTAgQEAgc3RhdGljIHZvaWQgc211X3YxM18wXzZfbG9n
X3RoZXJtYWxfdGhyb3R0bGluZ19ldmVudChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkNCiAgICAg
ICAgICAgICB0aHJvdHRsZXJfaWR4IDwgQVJSQVlfU0laRSh0aHJvdHRsaW5nX2xvZ2dpbmdfbGFi
ZWwpOw0KICAgICAgICAgICAgIHRocm90dGxlcl9pZHgrKykgew0KICAgICAgICAgICAgICAgIGlm
ICh0aHJvdHRsZXJfc3RhdHVzICYgKDFVIDw8IHRocm90dGxlcl9pZHgpKSB7DQotICAgICAgICAg
ICAgICAgICAgICAgICB0aHJvdHRpbmdfZXZlbnRzKys7DQorICAgICAgICAgICAgICAgICAgICAg
ICB0aHJvdHRsaW5nX2V2ZW50cysrOw0KICAgICAgICAgICAgICAgICAgICAgICAgYnVmX2lkeCAr
PSBzbnByaW50ZigNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9nX2J1ZiArIGJ1
Zl9pZHgsIHNpemVvZihsb2dfYnVmKSAtIGJ1Zl9pZHgsDQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICIlcyVzIiwgdGhyb3R0aW5nX2V2ZW50cyA+IDEgPyAiIGFuZCAiIDogIiIsDQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyVzIiwgdGhyb3R0bGluZ19ldmVudHMg
PiAxID8gIiBhbmQgIiA6ICIiLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aHJv
dHRsaW5nX2xvZ2dpbmdfbGFiZWxbdGhyb3R0bGVyX2lkeF0pOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGJ1Zl9pZHggPj0gc2l6ZW9mKGxvZ19idWYpKSB7DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoYWRldi0+ZGV2LCAiYnVmZmVyIG92ZXJmbG93IVxuIik7
DQotLQ0KMi4zOS4yDQoNCg==
