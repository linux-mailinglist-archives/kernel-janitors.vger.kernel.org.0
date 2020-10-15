Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED4228F2F6
	for <lists+kernel-janitors@lfdr.de>; Thu, 15 Oct 2020 15:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgJONMS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 15 Oct 2020 09:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728820AbgJONMS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Oct 2020 09:12:18 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69299C0613D3
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Oct 2020 06:12:18 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id k1so3951073ilc.10
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Oct 2020 06:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JrQAp+G/w/HRcUvrALtAjr5XUD+f148osx1+XDbx/fQ=;
        b=TMPDsFEY6QcbJz9eph5zwMwK3REFYpu/Kf99wKKHvUNjeCFeqY6R4mTOZY23moUy26
         rurYaAvGUoHOtOoW+PHtt5/hXy+/j9VbDMicj8j+TyBnkBB20/J6FDtPRzgBNL49uuyw
         CWKU3iFSYQLEpKIJCE9vhLrdWLv518JmrDHPkYRnHhJBJYn3KupmFAlwk8OHpWXg1sQB
         RMd0Ynbr9DG5O4vK98dJCSYrY1ArHTTIYOflX4lx35q3XLYxiaTm27ZFwkr6UDSxjlK8
         92zMXuTRKuoSztsTjE3N0yJfnq4Jk7d7yGtKXx3fLeZqjL3rnL6PRpSFH9Cnynkba7fP
         W4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JrQAp+G/w/HRcUvrALtAjr5XUD+f148osx1+XDbx/fQ=;
        b=eLEujjTvK7fNj98wlWoZyBbRx4zW6JPa2JLLPdyf70iOZ8t3tjqC12TB/ZW0uqx3mZ
         Hln7UlOc4RQFaPvddPY/C7RDg6wuWwwKInLYbVTYGqpCnAv4cPkUqSwIPu9WIlk1DOjQ
         BnNfxuJhmh9Sb9k3ANAslaslbHP6Wo9H2qi1wfZz3KnOKJ7RBzEyw5/ewd4xa/4tQJab
         5BKg3E+f5gzYT34DwN2oajJDaFqXwAwE13TOwbeDnu6AWNecCofdmDZU2p3744nLqE5m
         IlLNqyZFU/x30Zw1hdvUSWMibj4xrY36eCClmO6dxnQaaLSfAHc53g90TtC8iBi9OEC2
         bAvg==
X-Gm-Message-State: AOAM5305tWeVA3vWG52NTicwprtNLWm0YtLG5OZfBOyabfHGnW5cH4Px
        5qsRMWAWxf3hXv2ArdsDpC6V3g==
X-Google-Smtp-Source: ABdhPJzckRjsyjtt2YkhjIXx9g5RUmeO3YBn9nUW/Tceos9xwTtJgiku1z+klmtZupOu/z8YA1c/QQ==
X-Received: by 2002:a92:7742:: with SMTP id s63mr833462ilc.74.1602767537685;
        Thu, 15 Oct 2020 06:12:17 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h125sm793569iof.53.2020.10.15.06.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 06:12:17 -0700 (PDT)
Subject: Re: [PATCH][next] io_uring: fix flags check for the
 REQ_F_WORK_INITIALIZED setting
To:     Colin King <colin.king@canonical.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Pavel Begunkov <asml.silence@gmail.com>,
        linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201015115550.485235-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fc06e668-e358-9009-441e-d70b64285536@kernel.dk>
Date:   Thu, 15 Oct 2020 07:12:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015115550.485235-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 10/15/20 5:55 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for REQ_F_WORK_INITIALIZED is always true because
> the | operator is being used. I believe this check should be checking
> if the bit is set using the & operator.

It should - I folded in the incremental from Pavel. This just meant that
we took the slow and safe path, but it obviously should be an AND here.

-- 
Jens Axboe

