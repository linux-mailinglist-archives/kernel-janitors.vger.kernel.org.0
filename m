Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221CA4CFF97
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Mar 2022 14:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241162AbiCGNIc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Mar 2022 08:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237907AbiCGNIb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 08:08:31 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B814164FA
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Mar 2022 05:07:35 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id p15so31787284ejc.7
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Mar 2022 05:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=qPSb7alEZ/Eeb5SCmoxhDG7VBuzKJYC6GJ+6Y32Toy8=;
        b=6fuXVBQ5wSfZMU+1CHLz7UI1Vmf8om4FCXt/F3Z8ytF1Q+KaaL1TwSO1pv9lFLQZEE
         b8MQRxWbsJvVnVG6ksflktU98eKLLgJIpPU2J0EiK73IAcAC83GjXidhsEhMLPLThCKe
         6HqZtwR16J8KFQQoY+sLq0+6OCFIcsi1ZMAfCceicj/c/gIou0aGn//bpY8kt9hubGx+
         qxMpxcvhZLHKvEmt9hhaHEg0PpDDLwJhDd1kzexjU13MBVsnt+S7u/ywo+okJ/qhbx13
         2MzIYj2XW7RU7yfa8Du0s/7aMX7yaoX0SDaUZHuWP/y3ZHdY/5PfVd4MQBpLpZ9zctTx
         bCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=qPSb7alEZ/Eeb5SCmoxhDG7VBuzKJYC6GJ+6Y32Toy8=;
        b=zkdQI1xUL7QHkpCXU8gqRDiWFzOIk51T74wnh33z0aEuybWOcI8HFUt9wS5vwUmLnd
         9800zmgtAzNVFIioxxnrtUd3tmpQk9CM9PbfsXC4bPXMuIlcSJPYNaPa3Bi2ZCqQ+8GC
         06p1PAxQowoWUWoXR6aPLdR3lvVNDwYBMtdmbpj3c/NNwoMUFzQk26Gl7+cTFp2ApWRl
         iR9bqXc7Z81muWTsZG4oamWLJG3uV4RuOaJgsmTvA0z9jKHH7gRhx0QGz3dUgMhskgpF
         q1ABHZVzxzDrm6lE/ktT+fiKhUR3uxLzMAIcN2SnJbfYSrGcOefmRbbg8seKB1ar1E4i
         SR2A==
X-Gm-Message-State: AOAM532jS2snvJqQv9F6Jl+m/57wynLKf1r4iLYMydn8hSArqNBrkcO3
        x+1Z1zWOnS4pZVSJ8qKB2EE1lw==
X-Google-Smtp-Source: ABdhPJz0p/+V8oNwcV7Kz4CuXY7SHbyopgUgZsJrs/xnYbg7SnymRgC5PL6YDlZ4se6+I2Z6jqEDow==
X-Received: by 2002:a17:906:c344:b0:6b4:c768:4a9a with SMTP id ci4-20020a170906c34400b006b4c7684a9amr9134236ejb.151.1646658454171;
        Mon, 07 Mar 2022 05:07:34 -0800 (PST)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
        by smtp.gmail.com with ESMTPSA id er12-20020a056402448c00b00413d03ac4a2sm5865241edb.69.2022.03.07.05.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 05:07:33 -0800 (PST)
Message-ID: <2756c7b6-6402-3bef-a3ca-273459b9bda5@blackwall.org>
Date:   Mon, 7 Mar 2022 15:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH net-next] vxlan_core: delete unnecessary condition
Content-Language: en-US
From:   Nikolay Aleksandrov <razor@blackwall.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "David S. Miller" <davem@davemloft.net>,
        Nikolay Aleksandrov <nikolay@nvidia.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, Roopa Prabhu <roopa@nvidia.com>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220307125735.GC16710@kili>
 <c568979a-d3da-c577-840f-ca6689f7400f@blackwall.org>
In-Reply-To: <c568979a-d3da-c577-840f-ca6689f7400f@blackwall.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 07/03/2022 15:05, Nikolay Aleksandrov wrote:
> On 07/03/2022 14:57, Dan Carpenter wrote:
>> The previous check handled the "if (!nh)" condition so we know "nh"
>> is non-NULL here.  Delete the check and pull the code in one tab.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> This not a bug so a Fixes tag is innappropriate, however for reviewers
>> this was introduced in commit 4095e0e1328a ("drivers: vxlan: vnifilter:
>> per vni stats")
> 
> No, it was not introduced by that commit.
> It was introduced by commit:
>  1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
> 

Forgot to add: patch looks good to me. :)
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

Thanks,
 Nik

>> ---
>>  drivers/net/vxlan/vxlan_core.c | 54 ++++++++++++++++------------------
>>  1 file changed, 26 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
>> index 4ab09dd5a32a..795f438940ee 100644
>> --- a/drivers/net/vxlan/vxlan_core.c
>> +++ b/drivers/net/vxlan/vxlan_core.c
>> @@ -811,37 +811,35 @@ static int vxlan_fdb_nh_update(struct vxlan_dev *vxlan, struct vxlan_fdb *fdb,
>>  		goto err_inval;
>>  	}
>>  
>> -	if (nh) {
>> -		if (!nexthop_get(nh)) {
>> -			NL_SET_ERR_MSG(extack, "Nexthop has been deleted");
>> -			nh = NULL;
>> -			goto err_inval;
>> -		}
>> -		if (!nexthop_is_fdb(nh)) {
>> -			NL_SET_ERR_MSG(extack, "Nexthop is not a fdb nexthop");
>> -			goto err_inval;
>> -		}
>> +	if (!nexthop_get(nh)) {
>> +		NL_SET_ERR_MSG(extack, "Nexthop has been deleted");
>> +		nh = NULL;
>> +		goto err_inval;
>> +	}
>> +	if (!nexthop_is_fdb(nh)) {
>> +		NL_SET_ERR_MSG(extack, "Nexthop is not a fdb nexthop");
>> +		goto err_inval;
>> +	}
>>  
>> -		if (!nexthop_is_multipath(nh)) {
>> -			NL_SET_ERR_MSG(extack, "Nexthop is not a multipath group");
>> +	if (!nexthop_is_multipath(nh)) {
>> +		NL_SET_ERR_MSG(extack, "Nexthop is not a multipath group");
>> +		goto err_inval;
>> +	}
>> +
>> +	/* check nexthop group family */
>> +	switch (vxlan->default_dst.remote_ip.sa.sa_family) {
>> +	case AF_INET:
>> +		if (!nexthop_has_v4(nh)) {
>> +			err = -EAFNOSUPPORT;
>> +			NL_SET_ERR_MSG(extack, "Nexthop group family not supported");
>>  			goto err_inval;
>>  		}
>> -
>> -		/* check nexthop group family */
>> -		switch (vxlan->default_dst.remote_ip.sa.sa_family) {
>> -		case AF_INET:
>> -			if (!nexthop_has_v4(nh)) {
>> -				err = -EAFNOSUPPORT;
>> -				NL_SET_ERR_MSG(extack, "Nexthop group family not supported");
>> -				goto err_inval;
>> -			}
>> -			break;
>> -		case AF_INET6:
>> -			if (nexthop_has_v4(nh)) {
>> -				err = -EAFNOSUPPORT;
>> -				NL_SET_ERR_MSG(extack, "Nexthop group family not supported");
>> -				goto err_inval;
>> -			}
>> +		break;
>> +	case AF_INET6:
>> +		if (nexthop_has_v4(nh)) {
>> +			err = -EAFNOSUPPORT;
>> +			NL_SET_ERR_MSG(extack, "Nexthop group family not supported");
>> +			goto err_inval;
>>  		}
>>  	}
>>  
> 

