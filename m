Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB7B16C035
	for <lists+kernel-janitors@lfdr.de>; Tue, 25 Feb 2020 13:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgBYMGx (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 25 Feb 2020 07:06:53 -0500
Received: from mail-mw2nam10on2060.outbound.protection.outlook.com ([40.107.94.60]:6150
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726019AbgBYMGw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Feb 2020 07:06:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLXlQgzWwYJuW6cbyZvh2IZLKO1NlTKizDircMAyrONNZQxTgHO3isWsSZkR+S7xBSGLhEEEc8KFBUtN761Vpm2OhllMZZlNdcG946cv2shC0bOcoq3bY8PrBKJdAzkemL4tVBY7kG3z2PpfRQffBuNCe1509F7bDVapvDbjDFVGmTOEphSoIXm9pS8r0I4qyCFcZuxv3FV5ctxRRZ5t4FYmYrGkR6TjV6GAwL3fOTXOy/JVyf0L9KWcV+GZZ1I71lwf3OA8rP7iKW7aL65c55Aa02fYe2twACZEJ6iaxIjEsMNQXYWK68PTrdTE844zTF/38+lYb0gkEWXMUa/7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyhgOC7HHTL+5sWfrQkHOJHtYed1H3Xc1YiSyNgf3I4=;
 b=BIbV+8RhL03s9+aMkHVzwX82WMklXV2W54Vi9/iW5vaKvDZgh1SCYWPepe63OkJ4LeQR1nIvSijFw/IzcsO5O3/7uPAUlbtvLAFUSIASw+SsmFPsiBE4o8Kic7p82PF5aF9om1IeKloe2ljc0MIF8LwCzUGDFvWz9UHXzCnvTZvBGtu6lHpBfli7hMQy7xhyzlTfNDXK6pWXkMTr0AADJ+Ps9M5CaGMQ2NkFGRa50OzpNARdaiTsxADpIEpxI5tiAPHmTkyK8kZCpNKG+nJLlDA1CXNJ0Ix+aAbwgdWEwIpklCIR+SzHs5u64+v8hwF+OTYq8Be0LpqqJIzsda6J5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyhgOC7HHTL+5sWfrQkHOJHtYed1H3Xc1YiSyNgf3I4=;
 b=P0VlAIiWwBBJrTIcev0STebXLZuPCmnuciEGjszMU0mPO9cJ15Jf+/w+rs7r7B5LPqkCyPwCe6patEjkLcbj0kGnOLCFEgOntzzU3mSMYIw1BSlfkYdPyzs+txZJNg9cPuRaHQzWEs2eYd6+uTl1U6J2GnHvjSn6uPNv2jfXNhc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rijo-john.Thomas@amd.com; 
Received: from CY4PR12MB1925.namprd12.prod.outlook.com (2603:10b6:903:120::7)
 by CY4PR12MB1766.namprd12.prod.outlook.com (2603:10b6:903:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Tue, 25 Feb
 2020 12:06:47 +0000
Received: from CY4PR12MB1925.namprd12.prod.outlook.com
 ([fe80::ccd2:2608:7a9:6ae7]) by CY4PR12MB1925.namprd12.prod.outlook.com
 ([fe80::ccd2:2608:7a9:6ae7%10]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 12:06:46 +0000
Subject: Re: [PATCH v2] tee: amdtee: fix memory leak in amdtee_open_session()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Gary R Hook <gary.hook@amd.com>,
        Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>,
        tee-dev@lists.linaro.org, kernel-janitors@vger.kernel.org
References: <20200224105139.b5nweo2guprmxteu@kili.mountain>
From:   Rijo Thomas <Rijo-john.Thomas@amd.com>
Message-ID: <80bbfd17-b1d3-31f5-a2d7-c2163dc4d874@amd.com>
Date:   Tue, 25 Feb 2020 17:36:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200224105139.b5nweo2guprmxteu@kili.mountain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::20) To CY4PR12MB1925.namprd12.prod.outlook.com
 (2603:10b6:903:120::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.138.129.230] (165.204.156.251) by MA1PR01CA0150.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17 via Frontend Transport; Tue, 25 Feb 2020 12:06:44 +0000
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42ccf4ce-be33-4387-b0bf-08d7b9eb2fad
X-MS-TrafficTypeDiagnostic: CY4PR12MB1766:|CY4PR12MB1766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1766D8A517F7A2694182A61DCFED0@CY4PR12MB1766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(478600001)(956004)(16526019)(26005)(186003)(2616005)(53546011)(4326008)(36756003)(31686004)(66946007)(66556008)(66476007)(81166006)(16576012)(6486002)(316002)(5660300002)(52116002)(8936002)(110136005)(81156014)(2906002)(6666004)(31696002)(8676002)(54906003)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR12MB1766;H:CY4PR12MB1925.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e8pTNaiEVUM2pAqSnCRi+Zy6QuvLypGP/1vi/E/FozWrMPeV/DPRigkk8vIhiLz8eBEuewLp7b9KfhEjlEXQc1vGXfRtCrfxeoYe214t9UsoCHr2xZ4M4AIDfQ92DunJrUjbsJ6ajgmLEIg509gJOJu6j2eqYeU2ggSfYYpbBw/SubcccrLExdaavMUZxWK/BpM5BSyy5ZVfCpCGqer4joMx4qbsq4D0IBXH/QhMRzdvDL+EtLoESmT+dA1FuAycsr0haAd2OcgJa1dpXUstLhB0pAW5i59Q2EBT8ngOc/Y+qWLmpT0LOve5ECA8UbdS7bvvcjKz3fv47j22Y+Zk8ur273fIvnLbjYAm+AGQAcqCOeihBhgj3igoUJucxDxrxaxBu7Dw9wj6MHSshp7QoQg2wxj0cdDfYRmZKLO5vKEJ691FMb09cmdDJTog0CKY
X-MS-Exchange-AntiSpam-MessageData: /raUuZdcDgM/EQCAOCKa0XESB8hjGcOLIARyrkoD5DNyC7WtVKR8fflJhXzU+6rwkCfnvUArgmuyk+buPIOfgKZQ24UVn13RcqZogFuHONQg+mXGjYdjncTAyV9n0wr5T2FmloAxs43wqBvJpovcdA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ccf4ce-be33-4387-b0bf-08d7b9eb2fad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 12:06:46.6848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbs3OYpPsdw8Sxp4GjN8aQhglkG5JQ6vm6PipZkTFVbgPDpeI0VGUy5VnWd0FWbvVy0370H6UfSxABn1rpO7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1766
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 24/02/20 4:21 pm, Dan Carpenter wrote:
> On these error paths the "sess" variable isn't freed.  It's a refcounted
> pointer so we need to call kref_put().  I re-arranged the code a bit so
> the error case is always handled before the success case and the error
> paths are indented two tabs.
> 
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

Thanks,
Rijo

> ---
> v2: In the first version I changed these to return negative error codes,
>     but actually it's supposed to return success and the error code is
>     stored in arg->ret.
> 
>  drivers/tee/amdtee/core.c | 48 +++++++++++++++++++++++------------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/tee/amdtee/core.c b/drivers/tee/amdtee/core.c
> index 6370bb55f512..0026eb6f13ce 100644
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
> @@ -236,15 +249,13 @@ int amdtee_open_session(struct tee_context *ctx,
>  
>  	/* Load the TA binary into TEE environment */
>  	handle_load_ta(ta, ta_size, arg);
> -	if (arg->ret == TEEC_SUCCESS) {
> -		mutex_lock(&session_list_mutex);
> -		sess = alloc_session(ctxdata, arg->session);
> -		mutex_unlock(&session_list_mutex);
> -	}
> -
>  	if (arg->ret != TEEC_SUCCESS)
>  		goto out;
>  
> +	mutex_lock(&session_list_mutex);
> +	sess = alloc_session(ctxdata, arg->session);
> +	mutex_unlock(&session_list_mutex);
> +
>  	if (!sess) {
>  		rc = -ENOMEM;
>  		goto out;
> @@ -259,40 +270,29 @@ int amdtee_open_session(struct tee_context *ctx,
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
> +		goto out;
>  	}
> +
> +	sess->session_info[i] = session_info;
> +	set_session_id(sess->ta_handle, i, &arg->session);
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
