Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0128F15C00A
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Feb 2020 15:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730123AbgBMOGg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Feb 2020 09:06:36 -0500
Received: from mail-bn8nam11on2075.outbound.protection.outlook.com ([40.107.236.75]:6758
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730118AbgBMOGg (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Feb 2020 09:06:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/gArsZmntsipOW70MacBaaiOG0XYwFrF7b/2r1MnvpYVAnOEBmb4iOYLQIs4LiRyLSO4YNfxZoTf9CQhq9Jo6I/kVnaMamOTAasNYDoUVxcIxsQ2kbjKq6J6olj/jhEZC8ne4Ntzyz2FKu6To9hxK4u/KBdJ0jhEFNbHZuL3jJtKdTMZGRZdIUf4qWfltj5iCR64tjmY4Zp0gnwscQOWl8wZqSFJj+XAJzQjrTN1iPj2DNRAuolhiux8jWt1S7vQv9R8JKYg7MAF6INWum6D442eZHJ02iEJExV3ScPtDh63Kmy87Akiw29UJM5W7nAfrbdXs067Plgc5ryhMl36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKuoSWiJ/dbmf0Fv19H5hqzuYh2IbUGVZxGt1QkhcG8=;
 b=RbsVukmeTkk0NSXXeDZBKox44m73QilXkeEZtd4YrFZ/5M5YA/MuWEggqHKexyf6uHSIkjPri54RT0a5Ck1htnnJ5/NBSuRS+jrt8VlEu1p7gg6RqaWmTIpPaftLNPUp8m+ONpobOLBwjx6z2CuzqOxYQ9MkFVolmlMpWDgZXeeZyv1B5GL2l+2AhgceMeOPREIMPli6VMsSHOYIitR2Rn3TKn/9f94wOAjDh9P4u3eCRU3+4qnWFQGKwr8iIiWxWTp4d/jPD08FTwYVFxCoaI07pWiUFpoMBH7p7KTzmpHNQD1SrhV9qMtzovonE15IjaGY3Ejn+Xeiym5BizQzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKuoSWiJ/dbmf0Fv19H5hqzuYh2IbUGVZxGt1QkhcG8=;
 b=wuwAzj5qMTdq0cRF0gEw/Mgtsnm2Ib38YDWReQ+cdE+O2Ms7HwLaurTjielxuNfuD7Q0VT/R8saoivokZHg/Cf5LfjYr95msjjJ3RinfHNVdbm7ZYcOO1vVyNjTU5+l3LMCYS45fzDRxrjUYPwFB1HwiNFL/hHoIufYTYelUTo0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rijo-john.Thomas@amd.com; 
Received: from CY4PR12MB1925.namprd12.prod.outlook.com (10.175.62.7) by
 CY4PR12MB1479.namprd12.prod.outlook.com (10.172.70.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 13 Feb 2020 14:06:28 +0000
Received: from CY4PR12MB1925.namprd12.prod.outlook.com
 ([fe80::ccd2:2608:7a9:6ae7]) by CY4PR12MB1925.namprd12.prod.outlook.com
 ([fe80::ccd2:2608:7a9:6ae7%10]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 14:06:28 +0000
Subject: Re: [PATCH] tee: amdtee: Fix error handling in amdtee_open_session()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>, tee-dev@lists.linaro.org,
        kernel-janitors@vger.kernel.org
References: <20200212064649.fbfipw4pqv3bkdfl@kili.mountain>
From:   Rijo Thomas <Rijo-john.Thomas@amd.com>
Message-ID: <66f82e29-b31c-490e-0353-f1028fd1a131@amd.com>
Date:   Thu, 13 Feb 2020 19:36:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200212064649.fbfipw4pqv3bkdfl@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To CY4PR12MB1925.namprd12.prod.outlook.com
 (2603:10b6:903:120::7)
MIME-Version: 1.0
Received: from [10.138.129.230] (165.204.156.251) by MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Thu, 13 Feb 2020 14:06:26 +0000
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba4ee3c3-abec-420d-7de6-08d7b08deb84
X-MS-TrafficTypeDiagnostic: CY4PR12MB1479:|CY4PR12MB1479:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB14794590679B48CD91134EB6CF1A0@CY4PR12MB1479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(189003)(199004)(16526019)(36756003)(186003)(26005)(956004)(2616005)(66946007)(66476007)(53546011)(66556008)(478600001)(6486002)(52116002)(5660300002)(31696002)(16576012)(316002)(86362001)(4326008)(31686004)(6666004)(110136005)(54906003)(81166006)(81156014)(8936002)(2906002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR12MB1479;H:CY4PR12MB1925.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lrvEbvPJa9Y7PkRoeWXOEC1GnbT352jG2OgsEU2V7th7nmWCiJcL4K2d+xgj5LMXXXh3O4lkKzeV6B4EcMabRXthHxa4cLWBYmXNUK9VS3/Z7kD2bH2b7PD9eFh+CktjUtd9udLBlcGE6W730ucH0e+RAYBLHOyXBnKGmax0nRADeRhrI0xxMB0MBlV9e+Ru7Z1IsVyebjsTEjvAeeMjDCBPO2/xl6YKs7vOoYdoWwaSzbap2bKt98VNXYp+AtJ32mllKA93dGAab79hLrDaZqXKPBsoU9Jn1Rby7koj81bRC07N9csWe9eg5b2zF1eToZiG3C5gWcmEpO4gMMR9Q6j+YsX6yRfTzU82DNQ6Yx9L7Cvs9271ANLikunPaduROvjis5WH3y0SBGXfWvTOnnD0lI0USwMBA2SesNZeHJIGvS+vjKPrRhMIePoTcoV1
X-MS-Exchange-AntiSpam-MessageData: jYTVmZ9FbmnlyvX051UY6rDff4EQx6QOqZYRDgvV/b7+s8gopJ8MD8B2t/6acgO31MY7XqYEsegoppmOhRANDABKClLdC4sMFsR/uITBwbjDSq1bYS/dxEzvmzL47blfkZ8KcpTOoLdsmDXyjWdpZQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4ee3c3-abec-420d-7de6-08d7b08deb84
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 14:06:28.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUY2E/jZlvkiq9PJ3CYvzKu3DMDhaZ0u1jczJzlQjYGhhY+Gv+A4tU92zCdcAEyBLRylDuTGot+389MFBZEAIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1479
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 12/02/20 12:17 pm, Dan Carpenter wrote:
> On these error paths the "sess" variable isn't freed.  It's a refcounted
> pointer so we need to call kref_put().  The other problem is that the
> error code isn't always set.
> 

The driver does not set error code in rc so that the user space client library
can read the actual error code and return origin from arg->ret and arg->ret_origin.

Otherwise the patch looks good.

> I re-arranged the code a bit so the error case is always handled before
> the success case and the error paths are indented two tabs.
> 
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/tee/amdtee/core.c | 52 +++++++++++++++++++++++++----------------------
>  1 file changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index 6370bb55f512..40f3ff4cfae6 100644
> --- a/drivers/tee/amdtee/core.c
> +++ b/drivers/tee/amdtee/core.c
> @@ -212,6 +212,19 @@ static int copy_ta_binary(struct tee_context *ctx, void *ptr, void **ta,
>  	return rc;
>  }
>  
> +static void destroy_session(struct kref *ref)
> +{
> +	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
> +						   refcount);
> +
> +	/* Unload the TA from TEE */
> +	handle_unload_ta(sess->ta_handle);
> +	mutex_lock(&session_list_mutex);
> +	list_del(&sess->list_node);
> +	mutex_unlock(&session_list_mutex);
> +	kfree(sess);
> +}
> +
>  int amdtee_open_session(struct tee_context *ctx,
>  			struct tee_ioctl_open_session_arg *arg,
>  			struct tee_param *param)
> @@ -236,14 +249,14 @@ int amdtee_open_session(struct tee_context *ctx,
>  
>  	/* Load the TA binary into TEE environment */
>  	handle_load_ta(ta, ta_size, arg);
> -	if (arg->ret == TEEC_SUCCESS) {
> -		mutex_lock(&session_list_mutex);
> -		sess = alloc_session(ctxdata, arg->session);
> -		mutex_unlock(&session_list_mutex);
> +	if (arg->ret != TEEC_SUCCESS) {
> +		rc = -EINVAL;

As mentioned, rc should not be set to -EINVAL here. arg->ret and arg->ret_origin
will have the correct error code and return origin. Any non-zero rc value will be
treated by user space client library as error originating in driver. Error may even
originate in TEE or Trusted App, in which case rc should be 0.

> +		goto out;
>  	}
>  
> -	if (arg->ret != TEEC_SUCCESS)
> -		goto out;
> +	mutex_lock(&session_list_mutex);
> +	sess = alloc_session(ctxdata, arg->session);
> +	mutex_unlock(&session_list_mutex);
>  
>  	if (!sess) {
>  		rc = -ENOMEM;
> @@ -259,40 +272,31 @@ int amdtee_open_session(struct tee_context *ctx,
>  
>  	if (i >= TEE_NUM_SESSIONS) {
>  		pr_err("reached maximum session count %d\n", TEE_NUM_SESSIONS);
> +		kref_put(&sess->refcount, destroy_session);
>  		rc = -ENOMEM;
>  		goto out;
>  	}
>  
>  	/* Open session with loaded TA */
>  	handle_open_session(arg, &session_info, param);
> -
> -	if (arg->ret == TEEC_SUCCESS) {
> -		sess->session_info[i] = session_info;
> -		set_session_id(sess->ta_handle, i, &arg->session);
> -	} else {
> +	if (arg->ret != TEEC_SUCCESS) {
>  		pr_err("open_session failed %d\n", arg->ret);
>  		spin_lock(&sess->lock);
>  		clear_bit(i, sess->sess_mask);
>  		spin_unlock(&sess->lock);
> +		kref_put(&sess->refcount, destroy_session);
> +		rc = -EINVAL;

Ditto. rc should not be set to -EINVAL here.

Thanks,
Rijo

> +		goto out;
>  	}
> +
> +	sess->session_info[i] = session_info;
> +	set_session_id(sess->ta_handle, i, &arg->session);
> +
>  out:
>  	free_pages((u64)ta, get_order(ta_size));
>  	return rc;
>  }
>  
> -static void destroy_session(struct kref *ref)
> -{
> -	struct amdtee_session *sess = container_of(ref, struct amdtee_session,
> -						   refcount);
> -
> -	/* Unload the TA from TEE */
> -	handle_unload_ta(sess->ta_handle);
> -	mutex_lock(&session_list_mutex);
> -	list_del(&sess->list_node);
> -	mutex_unlock(&session_list_mutex);
> -	kfree(sess);
> -}
> -
>  int amdtee_close_session(struct tee_context *ctx, u32 session)
>  {
>  	struct amdtee_context_data *ctxdata = ctx->data;
> 
