Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5858315119
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 May 2019 18:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfEFQVu (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 May 2019 12:21:50 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54089 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfEFQVu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 May 2019 12:21:50 -0400
Received: by mail-it1-f195.google.com with SMTP id l10so21247288iti.3
        for <kernel-janitors@vger.kernel.org>; Mon, 06 May 2019 09:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JM/WZfijWawO0dM75sC9wd0xm0O1e7k2DME12T/WG/Q=;
        b=UFXgx9HuMJqBVirFEYXePbVMPL7ifubbChBpKxZBsozZhVZdUX8Ot96uTiSw/V7CNk
         fSLYzzNvhbUb5hAYmI5Zl6SEyQ2jdbAKtEms3Ypy2pQmMDDum4DOht2B4MltviwdHnoq
         pXa0AIgIt5dGhunS5vhMZ92AiF53tkkXPDPv+0pTedFeqkTRhFOKBfgyTCqxB/Bi1xP2
         dPQnaN2VrGkDeGBjsgm960JmoMz207/11+prKIuW9Ru/8earF5aZf93UhtGUWdlB18Eq
         8yfQOtssex78N19DTIEBJQMWZ9atH8CaNx3iNa+PeisifL3Ff8LW9WaSlUw/DyuxyxS9
         5Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JM/WZfijWawO0dM75sC9wd0xm0O1e7k2DME12T/WG/Q=;
        b=XQctNebgp9hU5bJV4uru+V16gLfSRrIrrf3yHTtVYBmc5/V9g7U6SVcyQ556T8mqXn
         2GImUuNMvtICxkw8K6I1YzqVue+FNvJDasdTXpcXsxWsr8NxnJiey6XAdrM7tKt/LjKG
         cJMcaQnU15utwmWyMRxiyXan7G5am/iLAgAOWQB+ulNZEEMYwjcGoYwKoQlMxs33sWEB
         STIkcWnAcYVS3fJPpsmBtfTtns/3Yc5TtzEtaRA+HwRiZSEvWbF5JwgnqXyvN6X08f/U
         +Q8zS72iQjXsqCYfenRGZvnuKjyc0GIaAWlwKb6goiRII/Uoueve72O1/BL1ujW8q/lF
         783Q==
X-Gm-Message-State: APjAAAVc+HyopmVhUDrhjrMcIz1gsm64EUSrJZEffUIsliPx2dirGJqs
        +bdQhPRrW5BDYCLTN82hsmELPQ==
X-Google-Smtp-Source: APXvYqx5RyQ8KTZzVdgGtPBddYXhbpfXTeY6xfZ5bVFKqngkFqVvd5/hfJWmx5YQugDGs5G6H8rXIA==
X-Received: by 2002:a24:6987:: with SMTP id e129mr18889644itc.28.1557159709220;
        Mon, 06 May 2019 09:21:49 -0700 (PDT)
Received: from [192.168.1.158] ([216.160.245.98])
        by smtp.gmail.com with ESMTPSA id d10sm3880686ios.72.2019.05.06.09.21.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 09:21:48 -0700 (PDT)
Subject: Re: [PATCH] io_uring: fix shadowed variable ret return code being not
 checked
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190505220122.5024-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <5ccacedd-41d9-f33c-25de-ae16bcdb7b08@kernel.dk>
Date:   Mon, 6 May 2019 10:21:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505220122.5024-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/5/19 4:01 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently variable ret is declared in a while-loop code block that
> shadows another variable ret. When an error occurs in the while-loop
> the error return in ret is not being set in the outer code block and
> so the error check on ret is always going to be checking on the wrong
> ret variable resulting in check that is always going to be true and
> a premature return occurs.
> 
> Fix this by removing the declaration of the inner while-loop variable
> ret so that shadowing does not occur.

Thanks, applied.

-- 
Jens Axboe

